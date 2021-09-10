extends Sprite

var positions = []
var index = 0
var actual_positions = []

func _ready():
	initializeCursor()

func set_selection(new_index):
	
	actual_positions = positions
	if new_index >= 0 and new_index < len(actual_positions):
		index = new_index
		var selected_node = actual_positions[index]
		position = Vector2(selected_node.rect_position.x - (get_rect().size.x * scale.x)/2, 
		selected_node.rect_position.y + selected_node.rect_size.y/2
		)

func _process(delta):
	if positions.size() == 0:
		initializeCursor()
	if self.visible == true:
		if Input.is_action_just_pressed("ui_up"):
			$menu_cursor_sound.play()
			set_selection(index-1)
		if Input.is_action_just_pressed("ui_down"):
			set_selection(index+1)
			$menu_cursor_sound.play()
		if Input.is_action_just_released("ui_accept") && actual_positions.size() > 0:
			var selected_entry = actual_positions[index]
			if  selected_entry == get_parent().get_node("Continue"):
				$confirm_new_load_sound.play()
				var stream_player = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("background_music")
				get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Tween").fade_out(stream_player)
				var timer = 250000
				while timer > 0:
					timer -= delta
			else: 
				$option_confirm_sound.play()
			selected_entry.callback()

func _on_Quit_visibility_changed():  # per far funzionare il cursore sulle opzioni
	initializeCursor()

func initializeCursor():
	positions = []
	for node in get_parent().get_children():
		if node is Label and node.visible:
			positions.append(node)
	set_selection(0)

func _on_Close_visibility_changed():
	initializeCursor()
