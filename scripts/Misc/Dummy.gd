extends Area2D


func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area2D):
	if area.get_parent().name == "Sword":
		var anim = get_parent().get_node("AnimationPlayer")
		anim.stop()
		anim.play("hit")

