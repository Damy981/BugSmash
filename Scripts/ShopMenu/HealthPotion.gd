extends Label

func callback():
	if PlayerProfile.coins >= 15:
		PlayerProfile.coins = PlayerProfile.coins -15
		PlayerProfile.potions = PlayerProfile.potions + 1
	else:
		get_parent().get_parent().get_parent().get_parent().get_parent().get_node("NotEnoughMoneyDialog").popup()
