extends TileMap


func _ready():
	if PlayerProfile.isInVillage == "true":
		PlayerProfile.isInVillage = "false"
		var player = get_parent().get_node("Player")
		player.position.x = 3400
		player.position.y = 2550
