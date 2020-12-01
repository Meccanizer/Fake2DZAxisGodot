extends Node2D

onready var boulder = preload("res://Scenes/Stone_Debris.tscn")
onready var parent = get_node("/root/Main/Spawner/YSort")

var canSpawn : bool = true

var option : int = 1

func _ready():
	print(parent)
	
func _process(delta: float) -> void:
	var mouse = get_global_mouse_position()
	
	if Input.is_action_just_pressed("one"):
		option = 1
	elif Input.is_action_just_pressed("two"):
		option = 2
		
	boulder = preload("res://Scenes/Dirt_Debris.tscn") if option == 1 else preload("res://Scenes/Stone_Debris.tscn")
	
	if Input.is_mouse_button_pressed(1) && canSpawn:
		canSpawn = !canSpawn
		$Timer.start()
		randomize()
		var maxNum : int = round(rand_range(4,8))
		for i in maxNum:
			#randomize()
			var b = boulder.instance()
			b.canBounce = true
			b.set_position(mouse)
			parent.add_child(b)
		
		
	


func _on_Timer_timeout() -> void:
	canSpawn = true
	pass
