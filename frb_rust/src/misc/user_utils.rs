use std::env;
use std::env::VarError;

/// Setup defaults that is usually useful for a new project.
/// Surely, you are free to customize everything.
pub fn setup_default_user_utils() {
    // setup log before others, such that we can see logs in other setup functions
    setup_log_to_console();
    setup_backtrace();
}

fn setup_backtrace() {
    if env::var("RUST_BACKTRACE").err() == Some(VarError::NotPresent) {
        env::set_var("RUST_BACKTRACE", "1");
    } else {
        debug!("Skip setup RUST_BACKTRACE because there is already environment variable");
    }
}

fn setup_log_to_console() {
    #[cfg(target_os = "android")]
    let _ = android_logger::init_once(
        android_logger::Config::default().with_max_level(LevelFilter::Trace),
    );

    #[cfg(target_os = "ios")]
    let _ = oslog::OsLogger::new("frb_user")
        .level_filter(LevelFilter::Trace)
        .init();

    // TODO add more platforms, e.g. web, ...
}
