extends Area2D
class_name Entity

var hp = 3
var flashtimer = 0.0

signal HpLost
signal Hit

func Ready(): pass
func Update(_delta): pass
func Physics_Update(_delta): pass


func _on_contact(area: Area2D):
	if area.get_parent() is Weapon:
		WeaponHit()
		Hit.emit()


func _hp_lost():
	PlayDamageAnimation()
	if hp <= 0:
		Destroy()


func Destroy():
	queue_free()


func WeaponHit():
	pass


func PlayDamageAnimation():
	var sprite = get_node("Sprite")
	sprite.material.set_shader_parameter("active", true)
	flashtimer = 0.2


func _ready():
	area_entered.connect(_on_contact)
	HpLost.connect(_hp_lost)

	Ready()


func _process(delta):
	if flashtimer > 0:
		flashtimer -= delta
		if flashtimer <= 0:
			var sprite = get_node("Sprite")
			sprite.material.set_shader_parameter("active", false)
	
	Update(delta)

func _physics_process(delta):
	Physics_Update(delta)
