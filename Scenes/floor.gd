extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


func _process(delta):
	
	var tarDir = (get_global_mouse_position() - get_position()).normalized()
	
	
	rotation = tarDir.angle()
	
	pass
