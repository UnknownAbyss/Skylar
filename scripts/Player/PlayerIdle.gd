extends State
class_name PlayerIdle

@export var player: Player


func Enter():
	var facing = player.controls.input_direction

	player.sprite_dir(facing, "idle_up", "idle_down")

	player.velocity = Vector2.ZERO


func Update(_delta):
	if player.controls.input_direction.length() > 0:
		Transitioned.emit(self, "PlayerWalk")

	if player.controls.attack:
		Transitioned.emit(self, "PlayerAtk")
