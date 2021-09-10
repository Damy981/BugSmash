extends Label

func callback():
	for member in get_tree().get_nodes_in_group("Functions"):
		member.visible = false
	for member in get_tree().get_nodes_in_group("Items"):
		member.visible = false
	for member in get_tree().get_nodes_in_group("ShopMenuOptions"):
		member.visible = true
