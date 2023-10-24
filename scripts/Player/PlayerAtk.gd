extends State
class_name PlayerAtk

@export var player: CharacterBody2D
@export var LEAP_DURATION = 0.15
@export var LEAP_SPEED = 150
var sword = preload("res://scripts/Weapons/Sword/Sword.tscn")

var sword_inst: Node2D
var anim_player: AnimationPlayer
var attack_dir: Vector2

var leap = 0.0


func Enter():
	leap = 0.0
	player.get_node("Sprite").pause()

	sword_inst = sword.instantiate()

	sword_inst.set_z_as_relative(true)
	if player.attack_state == 0:
		if player.facing.y < 0 || player.facing.x > 0:
			sword_inst.z_index = -1
	else:
		sword_inst.scale = Vector2(-1, 1)
		if player.facing.y < 0 || player.facing.x < 0:
			sword_inst.z_index = -1

	attack_dir = player.input_direction if player.input_direction.length() > 0 else player.facing

	sword_inst.rotate(atan2(attack_dir.y, attack_dir.x) + PI / 2)
	sword_inst.position += attack_dir * 10

	player.add_child(sword_inst)

	anim_player = sword_inst.get_node("AnimationPlayer")
	anim_player.play("swing")


func Exit():
	player.remove_child(sword_inst)
	sword_inst.free()
	player.attack_state = (player.attack_state + 1) % 2


func Update(delta):
	leap += delta
	player.velocity = attack_dir * LEAP_SPEED * int(leap < LEAP_DURATION)

	if not anim_player.is_playing():
		Transitioned.emit(self, "PlayerIdle")
