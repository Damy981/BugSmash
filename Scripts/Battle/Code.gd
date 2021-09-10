extends Label

func callback():
	get_parent().get_parent().get_parent().get_parent().get_node("Options").visible = true
	get_parent().get_parent().get_parent().get_parent().get_node("Options/VBoxContainerM/MenuEntries/OptionCursor").visible = true
	get_parent().get_parent().get_parent().get_parent().get_node("Options/VBoxContainerM/MenuEntries/OptionCursor").active = true
	get_parent().get_parent().get_parent().get_parent().get_node("CodeHistory").visible = true
	get_parent().get_parent().get_parent().get_parent().get_node("ColorRectFunctions/Functions/Control/SelectCursor").visible = false
	get_parent().get_parent().get_parent().get_parent().get_node("Attack").visible = true
	get_parent().get_parent().get_parent().get_parent().get_node("CommandsTitle").visible = true
	get_parent().get_node("SelectCursor").active = false
	
	var save_file = File.new()
	if save_file.file_exists("user://functions.save"):
		get_parent().get_parent().get_parent().get_parent().get_node("ShowFunctionsButton").visible = true
		get_parent().get_parent().get_parent().get_parent().get_node("ColorRectFunctions").visible = true
