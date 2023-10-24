extends CharacterBody2D


@export var facing = Vector2(-1, -1)
@export var input_direction = Vector2.ZERO
@export var attack_state = 0


# func _ready():
# 	z_index = 10


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

	move_and_slide()