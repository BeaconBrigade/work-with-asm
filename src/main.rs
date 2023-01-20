use std::{env, process::exit, ffi::CString};

#[link(name = "say_hi")]
extern "C" {
    /// greet some people from a different land
    fn say_hi();
    /// check if someone is cool
    /// 
    /// ## Safety
    /// 
    /// pass a pointer to a valid null-terminated string
    fn is_smt_cool(msg: *const i8);
}

fn main() -> Result<(), u32> {
    let str = env::args().nth(1).unwrap_or_else(|| {
        eprintln!("Usage: work-with-asm <NAME>");
        exit(1);
    });
    let c_str = CString::new(str).unwrap();
    unsafe { say_hi() };
    unsafe { is_smt_cool(c_str.as_ptr()) };

    Ok(())
}