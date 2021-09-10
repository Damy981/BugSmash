extends Label

func callback():
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("ColorRectQuests").visible = true
	get_parent().get_node("SelectCursor").visible = false
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("ColorRect").visible = false
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("HP").visible = false
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Coins").visible = false
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Potions").visible = false
