extends Node2D

var timer = 2 #wait 2 seconds

func _process(delta):
	if timer > 0:
		timer -= delta
		return
	else:
		ScreenManager.goto_scene("res://Scenes/Starting_Cave.tscn")
