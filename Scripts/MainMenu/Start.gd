extends Button

var gender = "male"

func _on_Start_pressed():
	if PlayerProfile.username != null:
		PlayerProfile.gender = gender
		PlayerProfile.initialize()
		Quests.initialize()
		var dir = Directory.new()
		dir.remove("user://functions.save")
		Pause.isPaused = false
		ScreenManager.goto_scene("res://Scenes/Black_Transition_Scene.tscn")
	else:
		self.release_focus()
		get_parent().get_parent().get_node("ErrorDialog").popup_centered()
	
	get_parent().get_node("MarginContainer/VBoxContainerM/MenuEntries/SelectCursor/option_confirm_sound").play()


func _on_Name_text_changed(new_text):
	PlayerProfile.username = new_text


func _on_Gender_item_selected(index):
	if index == 0:
		gender = "male"
	elif index == 1:
		gender = "female"
