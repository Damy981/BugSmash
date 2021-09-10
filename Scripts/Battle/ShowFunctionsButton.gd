extends Button


func _on_ShowFunctionsButton_pressed():
	self.release_focus()
	get_parent().get_node("Options/VBoxContainerM/MenuEntries/OptionCursor/option_confirm_sound").play()
	for node in get_parent().get_node("CodeHistory/VBoxContainerM/MenuEntries").get_children():
		node.queue_free()
	
	if self.text == "FUNZIONI":
		self.text = "ISTRUZIONI"
		get_parent().get_node("Options/VBoxContainerM/MenuEntries/OptionCursor").visible = false
		get_parent().get_node("ColorRectFunctions/Functions/Control/SelectCursor").visible = true
	else:
		self.text = "FUNZIONI"
		get_parent().get_node("Options/VBoxContainerM/MenuEntries/OptionCursor").visible = true
		get_parent().get_node("ColorRectFunctions/Functions/Control/SelectCursor").visible = false
