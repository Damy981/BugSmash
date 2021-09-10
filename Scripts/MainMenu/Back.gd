extends Label

func callback():
	
	var save_file = File.new()
	save_file.open("user://config.save", File.WRITE)
	save_file.store_double(PlayerProfile.volume)
	save_file.close()
	
	for node in get_parent().get_children():
		if node is Label:
			node.visible = not node.visible
