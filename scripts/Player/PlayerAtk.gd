extends State
class_name PlayerAtk

@export var player: Player
@export var LEAP_DURATION = 0.15
@export var LEAP_SPEED = 150
@export var ALERT_DURATION = 1
var sword = preload("res://scripts/Weapons/Sword/Sword.tscn")

var sword_inst: Node2D
var anim_player: AnimationPlayer
var attack_dir: Vector2

var leap = 0.0


func Enter():
	leap = 0.0
	attack_dir = player.get_mouse_dir()

	player.sprite_dir(attack_dir, "idle_up", "idle_down")

	sword_inst = sword.instantiate()

	if player.attack_state == 0:
		if attack_dir.y < 0 || attack_dir.x > 0:
			sword_inst.z_index = -1
	else:
		sword_inst.scale = Vector2(-1, 1)
		if attack_dir.y < 0 || attack_dir.x < 0:
			sword_inst.z_index = -1

	sword_inst.rotate(atan2(attack_dir.y, attack_dir.x) + PI / 2)
	sword_inst.position += attack_dir * 10

	player.add_child(sword_inst)

	anim_player = sword_inst.get_node("AnimationPlayer")
	anim_player.play("swing")


func Exit():
	player.remove_child(sword_inst)
	sword_inst.free()
	player.attack_state = (player.attack_state + 1) % 2
	player.alert_mode = ALERT_DURATION


func Update(delta):
	leap += delta
	player.velocity = attack_dir * LEAP_SPEED * int(leap < LEAP_DURATION)

	if not anim_player.is_playing():
		Transitioned.emit(self, "PlayerWalk")
