extends State
class_name PlayerWalk

@export var player: CharacterBody2D
@export var movespd := 400.0

func Update(_delta):
    var facing = player.facing
    var anim = player.get_node("Sprite")

    if facing.y < 0:
        anim.play("walk_up")
    else:
        anim.play("walk_down")        
    
    if facing.x < 0:
        anim.flip_h = true
    else:
        anim.flip_h = false

func Physics_Update(delta):
    var dir = player.input_direction

    if abs(dir.x) > 0:
        player.facing.x = dir.x
    player.facing.y = dir.y

    if dir.length() == 0:
        Transitioned.emit(self, "PlayerIdle")

    player.position += dir * delta * movespd