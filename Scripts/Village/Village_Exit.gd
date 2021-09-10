extends Area2D


func _process(_delta):
	
	if overlaps_body(get_parent().get_parent().get_node("Player")):
		ScreenManager.goto_scene("res://Scenes/Wood.tscn")
