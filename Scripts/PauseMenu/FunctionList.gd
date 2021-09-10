extends ColorRect

var functions = []
var font

func _ready():
	font = DynamicFont.new()
	font.font_data = load("res://Assets/VERDANAB.TTF")
	font.size = 20
	
	var save_file = File.new()
	if not save_file.file_exists("user://functions.save"):
		return
	save_file.open("user://functions.save", File.READ)
	
	while (!save_file.eof_reached()):
		var function = save_file.get_var()
		functions.append(function)
		
	save_file.close()
	functions.remove(len(functions) - 1)
	
	for f in functions:
		var label = Label.new()
		label.text = f.Name
		label.add_font_override("font", font)
		$MarginContainer/VBoxContainerM/MenuEntries.add_child(label)
	
func _on_BackButtonFunctions_pressed():
	self.visible = false
	$MarginContainer/VBoxContainerM/MenuEntries/SelectCursorFunctions.visible = false
	get_parent().get_node("ColorRectInstructions").visible = false
	get_parent().get_node("ColorRect/MarginContainer/VBoxContainerM/MenuEntries/SelectCursor").visible = true
	get_parent().get_node("ColorRect/MarginContainer/VBoxContainerM/MenuEntries/SelectCursor/option_confirm_sound").play()
	get_parent().get_node("ColorRect").visible = true
	get_parent().get_node("HP").visible = true
	get_parent().get_node("Coins").visible = true
	get_parent().get_node("Potions").visible = true
	for node in get_parent().get_node("ColorRectInstructions/MarginContainer/VBoxContainerM/MenuEntries").get_children():
		node.queue_free()
