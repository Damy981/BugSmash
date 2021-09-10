extends ColorRect

var font
var monsters_data


# Called when the node enters the scene tree for the first time.
func _ready():
	font = DynamicFont.new()
	font.font_data = load("res://Assets/VERDANAB.TTF")
	font.size = 20
	
	var monsterdata_file = File.new()
	monsterdata_file.open("res://enemies.json", File.READ)
	var monsterdata_json = JSON.parse(monsterdata_file.get_as_text())
	monsterdata_file.close()
	monsters_data = monsterdata_json.result
	
	var marginTop = 0
	
	for enemy in monsters_data:
		if enemy["atk"] != 1:
			for option in enemy["options"]:
				var label = Label.new()
				label.text = option
				label.margin_left = 50
				label.margin_top = marginTop
				marginTop += 28
				label.add_font_override("font", font)
				$ScrollContainer/VBoxContainerM/MenuEntries/.add_child(label)
	
	$ScrollContainer/VBoxContainerM/MenuEntries/SelectCursor.initalize()
