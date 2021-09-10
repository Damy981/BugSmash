extends Label

func callback():
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("ColorRectFunctions").visible = true
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("ColorRectShop").visible = false
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("ColorRectShop/MarginContainer/VBoxContainerM/MenuEntries/SelectCursor").visible = false
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("ColorRectFunctions/ScrollContainer/VBoxContainerM/MenuEntries/SelectCursor").visible = true
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("CodeHistory").visible = true
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Confirm").visible = true
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Name").visible = true
