extends TileMap
	
func _on_Wood_tree_entered():
	if Quests.bridgeQuestCompleted == "true":
		get_parent().remove_child(self)
