extends Weapon
class_name Sword

@export var sword_id = 0
@export var attack_speed = 3


func _ready():
	var wp_sprite = get_node("WeaponSprite")
	wp_sprite.frame = ((sword_id)%wp_sprite.hframes)*wp_sprite.hframes + sword_id/wp_sprite.vframes + 3

	var anim = get_node("AnimationPlayer")
	anim.speed_scale = attack_speed