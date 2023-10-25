extends Entity
class_name Dummy

func Ready():
	hp = 4

func WeaponHit():
	var anim = get_node("AnimationPlayer")
	anim.stop()
	anim.play("hit")
	hp -= 1
	HpLost.emit()
