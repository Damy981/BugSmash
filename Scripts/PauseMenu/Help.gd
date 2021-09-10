extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BackButtonHelp_pressed():
	$BackButtonHelp.release_focus()
	if $ScrollContainer2.visible :
		$ScrollContainer2.visible = false
		$ScrollContainer.visible = true
		get_parent().get_node("ColorRect/MarginContainer/VBoxContainerM/MenuEntries/SelectCursor/option_confirm_sound").play()
	else:
		self.visible = false
		$ScrollContainer/VBoxContainerM/MenuEntries/SelectCursorHelp.visible = false
		$ScrollContainer/VBoxContainerM/MenuEntries/SelectCursorHelp.flag = false
		get_parent().get_node("ColorRect/MarginContainer/VBoxContainerM/MenuEntries/SelectCursor").visible = true
		get_parent().get_node("HP").visible = true
		get_parent().get_node("Coins").visible = true
		get_parent().get_node("Potions").visible = true
		get_parent().get_node("ColorRect/MarginContainer/VBoxContainerM/MenuEntries/SelectCursor/option_confirm_sound").play()
		get_parent().get_node("ColorRect").visible = true
