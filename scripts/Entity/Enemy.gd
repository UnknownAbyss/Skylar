extends Entity
class_name Enemy


func WeaponHit():
	hp -= 1
	HpLost.emit()

func Ready():
	hp = 10

func Destroy():
	get_parent().queue_free()
