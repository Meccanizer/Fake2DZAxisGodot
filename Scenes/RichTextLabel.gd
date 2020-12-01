extends RichTextLabel



func _process(delta: float) -> void:
	text = "Number of Objects: " + String(Counter.counter)
