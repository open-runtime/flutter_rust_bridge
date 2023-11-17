use crate::codegen::generator::wire::rust::base::*;

mod boxed;
mod dart_opaque;
mod delegate;
mod dynamic;
mod enumeration;
mod general_list;
mod optional;
mod optional_list;
mod primitive;
mod primitive_list;
mod record;
mod rust_opaque;
mod structure;
mod unencodable;

use enum_dispatch::enum_dispatch;

#[enum_dispatch]
pub(crate) trait WireRustGeneratorWire2apiTrait {
    fn generate_wire2api_class(&self) -> Option<String> {
        None
    }

    fn wire2api_body(&self) -> Option<String> {
        None
    }
}
