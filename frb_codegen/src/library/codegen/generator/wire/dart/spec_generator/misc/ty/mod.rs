use crate::codegen::generator::wire::dart::spec_generator::base::*;

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

use crate::codegen::generator::wire::dart::spec_generator::output_code::WireDartOutputCode;
use enum_dispatch::enum_dispatch;

#[enum_dispatch]
pub(crate) trait WireDartGeneratorMiscTrait {
    fn generate_extra_functions(&self) -> Option<WireDartOutputCode> {
        None
    }
}
