extends CharacterBody2D

@onready var anim = $Sprite
const MOVESPD = 400

@export var facing = Vector2(-1, -1)
@export var input_direction = Vector2.ZERO
var is_moving = false


func get_input():
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

	var inp = Vector2.ZERO
	inp.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	inp.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return inp

func _physics_process(_delta):
	input_direction = get_input()
	
	# if Input.is_action_just_pressed("ui_select"):
	# 	anim.pause()
	# 	$Attack.attack(facing)
	# 	velocity = facing.normalized() * 0.5
		
	# position += velocity * delta * MOVESPD
