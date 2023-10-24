extends State
class_name PlayerIdle

@export var player: CharacterBody2D


func Enter():
	var facing = player.facing
	var anim = player.get_node("Sprite")

	if facing.y < 0:
		anim.play("idle_up")
	else:
		anim.play("idle_down")

	if facing.x < 0:
		anim.flip_h = true
	else:
		anim.flip_h = false

	player.velocity = Vector2.ZERO


func Update(_delta):
	if player.input_direction.length() > 0:
		Transitioned.emit(self, "PlayerWalk")

	if Input.is_action_just_pressed("ui_select"):
		Transitioned.emit(self, "PlayerAtk")
