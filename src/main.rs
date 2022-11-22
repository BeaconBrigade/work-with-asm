use std::{env, process::exit};

#[link(name = "say_hi")]
extern "C" {
    fn say_hi();
    fn is_smt_cool(msg: *const u8, len: u32);
}

fn main() -> Result<(), u32> {
    let str = env::args().nth(1).unwrap_or_else(|| {
        eprintln!("Usage: work-with-asm <NAME>");
        exit(1);
    });
    unsafe { say_hi() };
    unsafe { is_smt_cool(str.as_ptr(), str.len() as u32) };

    Ok(())
}
