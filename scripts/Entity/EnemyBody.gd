extends CharacterBody2D


@export var entity: Entity

func _ready():
	entity.Hit.connect(_x)

func _physics_process(delta):
	var player = get_tree().get_first_node_in_group("Player")
	var direction = (player.position - position).normalized()
	velocity = direction * 100
	move_and_collide(velocity * delta)

func _x():
	print("Faaltu")
