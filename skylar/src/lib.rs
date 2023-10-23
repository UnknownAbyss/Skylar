use godot::prelude::*;

struct MyExtension {}

#[gdextension]
unsafe impl ExtensionLibrary for MyExtension {}

#[derive(GodotClass)]
#[class(base=Node2D)]
struct Helper {
    #[base]
    _base: Base<Node2D>
}

#[godot_api]
impl Node2DVirtual for Helper {
    fn init(base: Base<Node2D>) -> Self {
        Self { _base: base }
    }
}

#[godot_api]
impl Helper {
    #[func]
    fn add(a: i32, b: i32) {
        godot_print!("{}", a+b);
    }
}