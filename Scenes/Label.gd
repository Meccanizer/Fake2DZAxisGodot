extends Label

var textToput = self.text + " "
onready var Spawner = get_node("/root/Main/Spawner")
func _process(delta: float) -> void:
	
	text = textToput + String(MainScript.counter) + "\nFPS: " + String(Engine.get_frames_per_second()) + "\nOption: " + String(Spawner.option)

	pass

