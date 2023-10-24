extends State
class_name PlayerWalk

@export var player: CharacterBody2D
@export var movespd := 250.0


func Update(_delta):
	var facing = player.input_direction
	var anim = player.get_node("Sprite")

	if facing.y < 0:
		anim.play("walk_up")
	else:
		anim.play("walk_down")

	if facing.x < 0:
		anim.flip_h = true
	else:
		anim.flip_h = false

	if Input.is_action_just_pressed("ui_select"):
		Transitioned.emit(self, "PlayerAtk")


func Physics_Update(_delta):
	var dir = player.input_direction

	if dir.length() > 0:
		player.facing = dir
	else:
		Transitioned.emit(self, "PlayerIdle")

	player.velocity = dir * movespd
