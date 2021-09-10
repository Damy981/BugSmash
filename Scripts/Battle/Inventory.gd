extends ItemList



func _on_Inventory_visibility_changed():
	self.grab_focus()
	if PlayerProfile.potions <= 0:
		self.set_item_disabled(0, true)


func _on_Inventory_item_activated(index):
	if index == 0:
		if PlayerProfile.potions > 0:
			PlayerProfile.hp += 5
			if PlayerProfile.hp > 15:
				PlayerProfile.hp = 15
			PlayerProfile.potions = PlayerProfile.potions - 1
