extends Label

func callback():
	for node in get_parent().get_children():
		node.visible = false
	get_parent().get_parent().get_parent().get_parent().get_node("Gender").visible = true
	get_parent().get_parent().get_parent().get_parent().get_node("Name").visible = true
	get_parent().get_parent().get_parent().get_parent().get_node("Start").visible = true
	get_parent().get_parent().get_parent().get_parent().get_node("BackButton").visible = true
