extends ScrollContainer

var font
var functions = []

# Called when the node enters the scene tree for the first time.
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
	
	var marginTop = 0
	
	for f in functions:
		var label = Label.new()
		label.text = f.Name
		label.margin_left = 50
		label.margin_top = marginTop
		marginTop += 28
		label.add_font_override("font", font)
		$Control.add_child(label)
