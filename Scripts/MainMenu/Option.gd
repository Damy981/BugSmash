extends Label

func callback():
	for node in get_parent().get_children():
		if node is Label:
			node.visible = not node.visible
