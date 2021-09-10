extends Area2D

func _ready():
	get_parent().get_parent().get_node("CanvasLayer/DemoEndPopup").get_close_button().visible = false

func _process(_delta):
	if overlaps_body(get_parent().get_parent().get_node("Player")):
		get_parent().get_parent().get_node("CanvasLayer/DemoEndPopup").popup()


func _on_DemoEndPopup_confirmed():
	ScreenManager.goto_scene("res://Scenes/MainMenutscn")


func _on_DemoEndPopup_about_to_show():
	get_tree().paused = true
