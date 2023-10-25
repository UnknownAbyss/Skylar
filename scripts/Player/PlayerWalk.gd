extends State
class_name PlayerWalk

@export var player: Player
@export var movespd := 250.0
@export var move_hindrance := 100.0


func Update(delta):
	var facing = player.controls.input_direction

	if player.alert_mode > 0:
		player.alert_mode -= delta
		player.sprite_dir(player.get_mouse_dir(), "walk_up", "walk_down", -1)
	else:
		player.sprite_dir(facing, "walk_up", "walk_down")


	if player.controls.attack:
		Transitioned.emit(self, "PlayerAtk")


func Physics_Update(_delta):
	var dir = player.controls.input_direction

	if dir.length() > 0:
		player.facing = dir
	else:
		Transitioned.emit(self, "PlayerIdle")
	
	if player.alert_mode > 0 && dir.dot(player.get_mouse_dir()) < 0:
		player.velocity = dir * (movespd - move_hindrance)
	else:
		player.velocity = dir * movespd

