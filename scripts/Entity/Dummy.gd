extends StaticBody2D
class_name Dummy

	
func WeaponHit():
	var anim = get_node("AnimationPlayer")
	anim.stop()
	anim.play("hit")
			
