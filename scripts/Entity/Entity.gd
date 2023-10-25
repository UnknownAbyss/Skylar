extends Area2D
class_name Entity

@export var root: Node

func _ready():
	area_entered.connect(_on_contact)

func _on_contact(area: Area2D):
	if area.get_parent() is Weapon:
		root.WeaponHit()
