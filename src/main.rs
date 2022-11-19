#[link(name = "say_hi")]
extern "C" {
    fn say_hi();
}

fn main() {
    println!("Calling say_hi...");
    unsafe { say_hi() };
    println!("Calling say_hi... done!");
}
