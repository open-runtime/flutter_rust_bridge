use crate::codegen::config::internal_config::GeneratorInternalConfig;
use crate::codegen::dumper::Dumper;
use crate::codegen::generator::misc::PathTexts;
use crate::codegen::ir::pack::IrPack;
use crate::codegen::misc::GeneratorProgressBarPack;

pub(crate) mod acc;
pub(crate) mod api_dart;
pub(crate) mod codec;
pub(crate) mod misc;
pub(crate) mod wire;

pub(crate) struct GeneratorOutput {
    pub output_texts: PathTexts,
    pub dart_needs_freezed: bool,
}

pub(crate) fn generate(
    ir_pack: &IrPack,
    config: &GeneratorInternalConfig,
    dumper: &Dumper,
    progress_bar_pack: &GeneratorProgressBarPack,
) -> anyhow::Result<GeneratorOutput> {
    let api_dart_output = api_dart::generate(ir_pack, &config.api_dart, dumper)?;
    let wire_output = wire::generate(
        ir_pack,
        &config.wire,
        &config.api_dart,
        &api_dart_output.output_texts.paths(),
        dumper,
        progress_bar_pack,
    )?;

    Ok(GeneratorOutput {
        output_texts: api_dart_output.output_texts + wire_output.output_texts,
        dart_needs_freezed: api_dart_output.needs_freezed,
    })
}
