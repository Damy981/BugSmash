extends Sprite

var positions = []
var index = 0
var actual_positions = []
var active = true
var nameFont
var functions = []

func _ready():
	nameFont = DynamicFont.new()
	nameFont.font_data = load("res://Assets/VERDANAB.TTF")
	nameFont.size = 20
	initalize()

func set_selection(new_index):
	actual_positions = positions
	if new_index >= 0 and new_index < len(actual_positions):
		index = new_index
		var selected_node = actual_positions[index]
		position = Vector2(selected_node.rect_position.x - (get_rect().size.x * scale.x)/2, 
		selected_node.rect_position.y + selected_node.rect_size.y/2
		)
	
func _process(_delta):
	if positions.size() == 0:
		initalize()
	if active == true && self.visible == true :
		if Input.is_action_just_pressed("ui_up"):
			$menu_cursor_sound.play()
			set_selection(index-1)
		if Input.is_action_just_pressed("ui_down"):
			set_selection(index+1)
			$menu_cursor_sound.play()
		if Input.is_action_just_pressed("ui_accept") && actual_positions.size() > 0:
			var selected_entry = actual_positions[index]
			$option_confirm_sound.play()
			for node in get_parent().get_parent().get_parent().get_parent().get_parent().get_node("ColorRectInstructions/MarginContainer/VBoxContainerM/MenuEntries").get_children():
				node.queue_free()
			for f in functions:
				if selected_entry.text == f.Name:
					for i in f.Instructions:
						var label = Label.new()
						label.text = i
						label.add_font_override("font", nameFont)
						get_parent().get_parent().get_parent().get_parent().get_parent().get_node("ColorRectInstructions/MarginContainer/VBoxContainerM/MenuEntries").add_child(label)

func initalize():
	for node in get_parent().get_children():
		if node is Label and node.visible:
			positions.append(node)
	set_selection(0)
	
	if len(functions) == 0:
		var save_file = File.new()
		if not save_file.file_exists("user://functions.save"):
			return
		save_file.open("user://functions.save", File.READ)
	
		while (!save_file.eof_reached()):
			var function = save_file.get_var()
			functions.append(function)
		
		save_file.close()
		functions.remove(len(functions) - 1)
