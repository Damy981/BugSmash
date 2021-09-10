extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		if $ColorRectFunctions.visible == true:
			hideFunctions()
		if $ColorRectShop/MarginContainer/VBoxContainerM/MenuEntries/HealthPotion.visible == true:
			for member in get_tree().get_nodes_in_group("Items"):
				member.visible = false
			for member in get_tree().get_nodes_in_group("ShopMenuOptions"):
				member.visible = true
		
		$ColorRectFunctions/ScrollContainer/VBoxContainerM/MenuEntries/SelectCursor/option_confirm_sound.play()
		
func hideFunctions(): 
	$ColorRectFunctions.visible = false
	$ColorRectShop.visible = true
	$ColorRectShop/MarginContainer/VBoxContainerM/MenuEntries/SelectCursor.visible = true
	$ColorRectFunctions/ScrollContainer/VBoxContainerM/MenuEntries/SelectCursor.visible = false
	$CodeHistory.visible = false
	$Confirm.visible = false
	$Name.visible = false
