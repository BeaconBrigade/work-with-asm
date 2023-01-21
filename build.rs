fn main() {
    #[cfg(all(target_arch = "x86_64", target_os = "windows"))]
    let (out, source) = ("say_hi.lib", "src/say_hi_windows_x86_64.asm");
    #[cfg(all(target_arch = "x86_64", target_os = "macos"))]
    let (out, source) = ("libsay_hi.a", "src/say_hi_macos_x86_64.asm");
    #[cfg(target_arch = "aarch64")]
    let (out, source) = ("libsay_hi.a", "src/say_hi_aarch64.asm");
    println!("cargo:rerun-if-changed={source}");
    nasm_rs::compile_library_args(out, &[source], &["-g"]).unwrap();
}
