use crate::codegen::generator::acc::Acc;
use crate::codegen::generator::misc::target::{Target, TargetOrCommon};
use crate::codegen::generator::wire::dart::spec_generator::base::*;
use crate::codegen::generator::wire::dart::spec_generator::transfer::cst::base::*;
use crate::codegen::generator::wire::dart::spec_generator::transfer::cst::encoder::ty::WireDartTransferCstGeneratorEncoderTrait;
use crate::codegen::ir::ty::dart_opaque::IrTypeDartOpaque;
use crate::codegen::ir::ty::IrType;

impl<'a> WireDartTransferCstGeneratorEncoderTrait for DartFnWireDartTransferCstGenerator<'a> {
    fn api2wire_body(&self) -> Acc<Option<String>> {
        Acc::new(|target| match target {
            TargetOrCommon::Io | TargetOrCommon::Wasm => {
                Some("return api2wire_DartOpaque(raw);".to_owned())
            }
            TargetOrCommon::Common => None,
        })
    }

    fn dart_wire_type(&self, target: Target) -> String {
        WireDartGenerator::new(self.ir.get_delegate(), self.context).dart_wire_type(target)
    }
}
