extends TileMap

func _process(_delta):
	if PlayerProfile.secondTutorialFinished == "false":
		get_parent().get_node("CanvasLayer/TutorialDialog").popup_centered()


func _on_TutorialDialog_confirmed():
	get_tree().paused = false
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
# warning-ignore:return_value_discarded
	ResourceSaver.save("res://beforeBattleSave.tscn", packed_scene)
	ScreenManager.goto_scene("res://Scenes/Battle.tscn")
