extends Node

onready var counter = 0

export  onready var actualPreload = preload("res://Scenes/ActualLeftOver.tscn")
export  onready var shadow = preload("res://Scenes/Dirt_Shadow.tscn")


func _input(event):
	
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	pass
	

	
