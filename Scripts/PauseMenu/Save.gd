extends Label

func callback():
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
# warning-ignore:return_value_discarded
	ResourceSaver.save("res://save.tscn", packed_scene)
	
	var save_file = File.new()
	save_file.open("user://game.save", File.WRITE)
	save_file.store_line(PlayerProfile.username)
	save_file.store_line(PlayerProfile.gender)
	save_file.store_line(PlayerProfile.exitedFromCave)
	save_file.store_line(PlayerProfile.isInVillage)
	save_file.store_float(PlayerProfile.hp)
	save_file.store_line(PlayerProfile.isInShop)
	save_file.store_line(PlayerProfile.isInInn)
	save_file.store_float(PlayerProfile.atk)
	save_file.store_line(PlayerProfile.firstTutorialFinished)
	save_file.store_line(PlayerProfile.secondTutorialFinished)
	save_file.store_float(PlayerProfile.potions)
	save_file.store_float(PlayerProfile.coins)
	save_file.store_line(Quests.bridgeQuestActive)
	save_file.store_line(Quests.bridgeQuestCompleted)
	save_file.store_float(Quests.bridgeQuestCurrent)
	save_file.store_line(PlayerProfile.thirdTutorialFinished)
	save_file.close()
