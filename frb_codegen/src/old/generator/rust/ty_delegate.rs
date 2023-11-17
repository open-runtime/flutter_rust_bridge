use crate::generator::rust::ty::*;
use crate::generator::rust::{
    generate_list_allocate_func, ExternFuncCollector, TypeGeneralListGenerator,
};
use crate::ir::*;
use crate::target::{Acc, Target};
use crate::type_rust_generator_struct;
use crate::utils::misc::BlockIndex;

use super::get_into_into_dart;

type_rust_generator_struct!(TypeDelegateGenerator, IrTypeDelegate);

macro_rules! delegate_enum{
    ($self:ident, $func:ident($($tokens:tt)*), $ret:expr) => {
        if let IrTypeDelegate:: PrimitiveEnum {
            ir,
            ..
        } = &$self.ir {
            super::TypeEnumRefGenerator {
                ir: ir.clone(),
                context: $self.context.clone(),
            }
            .$func($($tokens)*)
        }
        else {
            $ret
        }
    };
}

impl TypeRustGeneratorTrait for TypeDelegateGenerator<'_> {
    fn wire2api_body(&self) -> Acc<Option<String>> {
        match &self.ir {
            IrTypeDelegate::Array(array) => {
                let acc =
                    Some(
                        format!(
                            "let vec: Vec<{}> = self.wire2api(); support::from_vec_to_array(vec)",
                            array.inner_rust_api_type()
                        ),
                    );
                if array.inner_is_js_value() {
                    return Acc {
                        io: acc,
                        ..Default::default()
                    };
                }
                Acc::distribute(acc)
            },
            IrTypeDelegate::String => {
                Acc {
                    wasm: Some("self".into()),
                    io: Some("let vec: Vec<u8> = self.wire2api(); String::from_utf8_lossy(&vec).into_owned()".into()),
                    ..Default::default()
                }
            },
            IrTypeDelegate::ZeroCopyBufferVecPrimitive(_) => {
                Acc::distribute(Some("ZeroCopyBuffer(self.wire2api())".into()))
            },
            IrTypeDelegate::StringList => Acc {
                io: Some(TypeGeneralListGenerator::WIRE2API_BODY_IO.to_owned()),
                wasm: Some(TypeGeneralListGenerator::WIRE2API_BODY_WASM.to_owned()),
                ..Default::default()
            },
            IrTypeDelegate::PrimitiveEnum { ir, .. } => {
                let enu = ir.get(self.context.ir_pack);
                let variants =
                    (enu.variants().iter().enumerate())
                        .map(|(idx, variant)| format!("{} => {}::{},", idx, enu.name, variant.name))
                        .collect_vec()
                        .join("\n");
                format!(
                    "match self {{
                        {}
                        _ => unreachable!(\"Invalid variant for {}: {{}}\", self),
                    }}",
                    variants,
                    enu.name
                ).into()
            },
            IrTypeDelegate::Time(ir) => {
                if ir == &IrTypeDelegateTime::Duration {
                    return Acc {
                        io: Some("chrono::Duration::microseconds(self)".into()),
                        wasm: Some("chrono::Duration::milliseconds(self)".into()),
                        ..Default::default()
                    };
                }
                let codegen_timestamp = "let Timestamp { s, ns } = wire2api_timestamp(self);";
                let codegen_naive =
                    "chrono::NaiveDateTime::from_timestamp_opt(s, ns).expect(\"invalid or out-of-range datetime\")";
                let codegen_utc = format!("chrono::DateTime::<chrono::Utc>::from_utc({codegen_naive}, chrono::Utc)");
                let codegen_local = format!("chrono::DateTime::<chrono::Local>::from({codegen_utc})");
                let codegen_conversion = match ir {
                    IrTypeDelegateTime::Naive => codegen_naive,
                    IrTypeDelegateTime::Utc => codegen_utc.as_str(),
                    IrTypeDelegateTime::Local => codegen_local.as_str(),
                    IrTypeDelegateTime::Duration => unreachable!(),
                };
                Acc {
                    common: Some(format!("{codegen_timestamp}{codegen_conversion}")),
                    ..Default::default()
                }
            },
            IrTypeDelegate::TimeList(_) => {
                Acc::distribute(
                    Some(
                        "let vec: Vec<i64> = self.wire2api(); vec.into_iter().map(Wire2Api::wire2api).collect()".into()
                    )
                )
            }
            IrTypeDelegate::Uuid => Acc::distribute(
                Some(
                    "let single: Vec<u8> = self.wire2api(); wire2api_uuid_ref(single.as_slice())".into(),
                ),
            ),
            IrTypeDelegate::Uuids => Acc::distribute(
                Some(
                    "let multiple: Vec<u8> = self.wire2api(); wire2api_uuids(multiple)".into(),
                ),
            ),
            IrTypeDelegate::Backtrace | IrTypeDelegate::Anyhow => "self.wire2api()".into(),
        }
    }

    fn wire_struct_fields(&self) -> Option<Vec<String>> {
        match &self.ir {
            ty @ IrTypeDelegate::StringList => Some(vec![
                format!(
                    "ptr: *mut *mut {}",
                    ty.get_delegate().rust_wire_type(Target::Io)
                ),
                "len: i32".to_owned(),
            ]),
            _ => None,
        }
    }

    fn allocate_funcs(
        &self,
        collector: &mut ExternFuncCollector,
        _: BlockIndex,
    ) -> Acc<Option<String>> {
        match &self.ir {
            list @ IrTypeDelegate::StringList => Acc {
                io: Some(generate_list_allocate_func(
                    collector,
                    &self.ir.safe_ident(),
                    list,
                    &list.get_delegate(),
                    self.context.config.block_index,
                )),
                ..Default::default()
            },
            _ => Default::default(),
        }
    }

    fn impl_intodart(&self) -> String {
        if let IrTypeDelegate::PrimitiveEnum { ir, .. } = &self.ir {
            let src = ir.get(self.context.ir_pack);
            let (name, self_path): (&str, &str) = match &src.wrapper_name {
                Some(wrapper) => (wrapper, &src.name),
                None => (&src.name, "Self"),
            };
            let self_ref = self.self_access("self".to_owned());
            let variants = src
                .variants()
                .iter()
                .enumerate()
                .map(|(idx, variant)| format!("{}::{} => {},", self_path, variant.name, idx))
                .collect_vec()
                .join("\n");
            let into_into_dart = get_into_into_dart(&src.name, src.wrapper_name.as_ref());
            return format!(
                "impl support::IntoDart for {name} {{
                    fn into_dart(self) -> support::DartAbi {{
                        match {self_ref} {{
                            {variants}
                        }}.into_dart()
                    }}
                }}
                impl support::IntoDartExceptPrimitive for {name} {{}}
                {into_into_dart}
                "
            );
        }
        "".into()
    }

    fn wire2api_jsvalue(&self) -> Option<std::borrow::Cow<str>> {
        Some(match &self.ir {
            IrTypeDelegate::String => {
                "self.as_string().expect(\"non-UTF-8 string, or not a string\")".into()
            }
            IrTypeDelegate::PrimitiveEnum { repr, .. } => format!(
                "(self.unchecked_into_f64() as {}).wire2api()",
                repr.rust_wire_type(Target::Wasm)
            )
            .into(),
            IrTypeDelegate::ZeroCopyBufferVecPrimitive(_) => {
                "ZeroCopyBuffer(self.wire2api())".into()
            }
            IrTypeDelegate::Time(_) => "Wire2Api::<i64>::wire2api(self).wire2api()".into(),
            IrTypeDelegate::TimeList(_) =>
                "self.unchecked_into::<js_sys::BigInt64Array>().to_vec().into_iter().map(Wire2Api::wire2api).collect()".into(),
            IrTypeDelegate::Uuid | IrTypeDelegate::Uuids => {
                "self.unchecked_into::<js_sys::Uint8Array>().to_vec().into_boxed_slice().wire2api()"
                    .into()
            }
            IrTypeDelegate::Array(array) => format!(
                "let vec: Vec<{}> = self.wire2api(); support::from_vec_to_array(vec)",
                array.inner_rust_api_type()
            )
            .into(),
            _ => return None,
        })
    }

    fn imports(&self) -> Option<String> {
        delegate_enum!(self, imports(), None)
    }

    fn wrapper_struct(&self) -> Option<String> {
        delegate_enum!(self, wrapper_struct(), None)
    }

    fn self_access(&self, obj: String) -> String {
        delegate_enum!(self, self_access(obj), obj)
    }

    fn static_checks(&self) -> Option<String> {
        delegate_enum!(self, static_checks(), None)
    }
}
