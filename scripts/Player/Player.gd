extends CharacterBody2D
class_name Player

@export var facing = Vector2(-1, -1)
@export var attack_state = 0
var alert_mode = 0

var controls: Dictionary = {
	input_direction = Vector2.ZERO,
	attack = false,
}

func sprite_dir(vec: Vector2, up: String, down: String, t_scale = 1.0):
	var anim = get_node("Sprite")
	anim.speed_scale = t_scale

	if vec.y < 0 && abs(vec.x) <= abs(vec.y):
		anim.play(up)
	else:
		anim.play(down)

	if vec.x <= 0:
		anim.flip_h = true
	else:
		anim.flip_h = false

func get_mouse_dir():
	return (get_global_mouse_position() - position).normalized()

func get_move_input():
	var inp = Vector2.ZERO
	inp.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	inp.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return inp

func get_attack():
	return Input.is_action_just_pressed("ui_attack")


func _physics_process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

	controls.input_direction = get_move_input()
	controls.attack = get_attack()

	move_and_slide()
