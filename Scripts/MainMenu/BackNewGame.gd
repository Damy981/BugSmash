extends Button

func _input(event):
	if self.visible == true && event.is_action_pressed("pause"):
		goBack()


func _on_Back_pressed():
	goBack()

func goBack():
	get_parent().get_node("Gender").visible = false
	get_parent().get_node("Name").visible = false
	get_parent().get_node("Start").visible = false
	get_parent().get_node("BackButton").visible = false
	
	var menuNode = get_parent().get_node("MarginContainer/VBoxContainerM/MenuEntries")
	for node in menuNode.get_children():
		if node.name != "Volume" && node.name != "Back":
			node.visible = true
	get_parent().get_node("MarginContainer/VBoxContainerM/MenuEntries/SelectCursor/option_confirm_sound").play()
