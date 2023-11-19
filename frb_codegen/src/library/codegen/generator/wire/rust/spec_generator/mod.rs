use crate::codegen::generator::wire::rust::spec_generator::api2wire::WireRustOutputSpecApi2wire;
use crate::codegen::generator::wire::rust::spec_generator::base::WireRustGeneratorContext;
use crate::codegen::generator::wire::rust::spec_generator::misc::WireRustOutputSpecMisc;
use crate::codegen::generator::wire::rust::spec_generator::wire2api::WireRustOutputSpecWire2api;
use crate::codegen::ir::pack::{IrPack, IrPackComputedCache};

pub(crate) mod api2wire;
pub(crate) mod base;
pub(in crate::library::codegen::generator::wire::rust) mod extern_func;
pub(crate) mod misc;
pub mod output_code;
pub(crate) mod wire2api;

pub(super) struct WireRustOutputSpec {
    misc: WireRustOutputSpecMisc,
    wire2api: WireRustOutputSpecWire2api,
    api2wire: WireRustOutputSpecApi2wire,
}

pub(super) fn generate(ir_pack: &IrPack, context: WireRustGeneratorContext) -> WireRustOutputSpec {
    let cache = IrPackComputedCache::compute(ir_pack);
    WireRustOutputSpec {
        misc: misc::generate(context, &cache),
        wire2api: wire2api::generate(context, &cache),
        api2wire: api2wire::generate(context, &cache),
    }
}
