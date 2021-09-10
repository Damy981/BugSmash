extends Sprite

var positions = []
var index = 0
var actual_positions = []
var active = true
var nameFont
var functions = []
var entriesInHistory = []
var functionSelected = false

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
			get_parent().get_parent().get_parent().get_node("Functions").get_v_scrollbar().value -= 24
		if Input.is_action_just_pressed("ui_down"):
			set_selection(index+1)
			$menu_cursor_sound.play()
			get_parent().get_parent().get_parent().get_node("Functions").get_v_scrollbar().value += 24
		if Input.is_action_just_pressed("ui_accept") && actual_positions.size() > 0:
			var selected_entry = actual_positions[index]
			$option_confirm_sound.play()
			for f in functions:
				if selected_entry.text == f.Name:
					if !entriesInHistory.has(selected_entry) && functionSelected == false:
						entriesInHistory.append(selected_entry)
						moveToHistory(selected_entry)
						selected_entry.add_color_override("font_color", Color(0,0,0,1))
						functionSelected = true
					elif entriesInHistory.has(selected_entry):
						moveToFunctions(selected_entry)
						selected_entry.add_color_override("font_color", Color(1,1,1,1))
						functionSelected = false

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
		
func moveToHistory(entry):
	var label = Label.new()
	label.text = entry.text
	label.add_font_override("font", nameFont)
	get_parent().get_parent().get_parent().get_parent().get_node("CodeHistory/VBoxContainerM/MenuEntries").add_child(label)
	
func moveToFunctions(entry):
	entriesInHistory.erase(entry)
	for node in get_parent().get_parent().get_parent().get_parent().get_node("CodeHistory/VBoxContainerM/MenuEntries").get_children():
		if node.text == entry.text:
			get_parent().get_parent().get_parent().get_parent().get_node("CodeHistory/VBoxContainerM/MenuEntries").remove_child(node)
