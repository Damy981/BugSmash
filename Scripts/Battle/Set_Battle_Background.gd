extends Sprite

func _ready():
	if PlayerProfile.exitedFromCave == "false":
		self.visible = true
		get_parent().get_node("Wood_Backgroun").visible = false
