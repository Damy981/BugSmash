extends TileMap


func _ready():
	if PlayerProfile.isInShop == "true":
		PlayerProfile.isInShop = "false"
		var player = get_parent().get_node("Player")
		player.position.x = 980
		player.position.y = 1213
	if PlayerProfile.isInInn == "true":
		PlayerProfile.isInInn = "false"
		var player = get_parent().get_node("Player")
		player.position.x = 3407
		player.position.y = 1242
