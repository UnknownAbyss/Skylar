extends Node2D


var sword;
var atk;
signal atkdone()

# Called when the node enters the scene tree for the first time.
func _ready():
	sword = preload("res://scenes/swordatk.tscn")

func attack(prev_dir):
	atk = sword.instantiate()
	add_child(atk)
	atk.transform = get_node("../Sprite").transform
	atk.position += prev_dir*64
	atk.rotate(atan2(prev_dir.y,prev_dir.x) + PI/2)

func _process(_delta):
	if not is_instance_valid(atk):
		emit_signal("atkdone")
