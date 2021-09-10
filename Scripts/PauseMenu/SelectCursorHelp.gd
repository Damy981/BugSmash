extends Sprite

var positions = []
var index = 0
var actual_positions = []
var active = true
var nameFont
var entriesInHistory = []
var flag = false

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
	if active == true && get_parent().get_parent().get_parent().visible == true :
		if Input.is_action_just_pressed("ui_up"):
			$menu_cursor_sound.play()
			set_selection(index-1)
			get_parent().get_parent().get_parent().get_parent().get_node("ScrollContainer").get_v_scrollbar().value -= 24
		if Input.is_action_just_pressed("ui_down"):
			set_selection(index+1)
			$menu_cursor_sound.play()
			get_parent().get_parent().get_parent().get_parent().get_node("ScrollContainer").get_v_scrollbar().value += 24
		if Input.is_action_just_pressed("ui_accept") && actual_positions.size() > 0:
			if flag:
				var selected_entry = actual_positions[index]
				$option_confirm_sound.play()
				selected_entry.callback(selected_entry.name)
			else:
				flag = true

func initalize():
	for node in get_parent().get_children():
		if node is Label and node.visible:
			positions.append(node)
	set_selection(0)
