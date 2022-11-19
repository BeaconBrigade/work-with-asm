fn main() {
    println!("cargo:rerun-if-changed=src/say_hi.asm");
    
    nasm_rs::compile_library("libsay_hi.a", &["src/say_hi.asm"]).unwrap();
}
