extends Label

func callback():
	get_parent().get_parent().get_parent().get_parent().get_node("Inventory").visible = true
	get_parent().get_node("SelectCursor").active = false
