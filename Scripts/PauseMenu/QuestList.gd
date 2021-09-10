extends ColorRect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Quests.bridgeQuestActive == "true":
		$"MarginContainer/VBoxContainerM/Quest".text = Quests.bridgeQuestText +  str(Quests.bridgeQuestCurrent) + "/ 5"

func _on_BackButtonQuests_pressed():
	self.visible = false
	get_parent().get_node("ColorRect/MarginContainer/VBoxContainerM/MenuEntries/SelectCursor").visible = true
	get_parent().get_node("ColorRect").visible = true
	get_parent().get_node("HP").visible = true
	get_parent().get_node("Coins").visible = true
	get_parent().get_node("Potions").visible = true
	get_parent().get_node("ColorRect/MarginContainer/VBoxContainerM/MenuEntries/SelectCursor/option_confirm_sound").play()
