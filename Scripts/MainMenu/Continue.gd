extends Label

func callback():
	var packed_scene = load("res://save.tscn")
	
	if (packed_scene != null):
		ScreenManager.goto_scene("res://save.tscn")
		
		var save_file = File.new()
		if not save_file.file_exists("user://game.save"):
			return
		save_file.open("user://game.save", File.READ)
		PlayerProfile.username = (save_file.get_line())
		PlayerProfile.gender = (save_file.get_line())
		PlayerProfile.exitedFromCave = (save_file.get_line())
		PlayerProfile.isInVillage = (save_file.get_line())
		PlayerProfile.hp = (save_file.get_float())
		PlayerProfile.isInShop = (save_file.get_line())
		PlayerProfile.isInInn = (save_file.get_line())
		PlayerProfile.atk = (save_file.get_float())
		PlayerProfile.firstTutorialFinished = (save_file.get_line())
		PlayerProfile.secondTutorialFinished = (save_file.get_line())
		PlayerProfile.potions = (save_file.get_float())
		PlayerProfile.coins = (save_file.get_float())
		Quests.bridgeQuestActive = (save_file.get_line())
		Quests.bridgeQuestCompleted = (save_file.get_line())
		Quests.bridgeQuestCurrent = (save_file.get_float())
		PlayerProfile.thirdTutorialFinished = (save_file.get_line())
		print("Loaded")
		save_file.close()
