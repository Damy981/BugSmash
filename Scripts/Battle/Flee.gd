extends Label

var flee = false

func _ready():
	randomize()
	get_parent().get_parent().get_parent().get_parent().get_node("FleeDialog").get_close_button().visible = false

func callback():
	
	var packed_scene = load("res://beforeBattleSave.tscn")
	if PlayerProfile.exitedFromCave == "true" && PlayerProfile.secondTutorialFinished == "true":
		if (packed_scene != null):
			if int(rand_range(1,3)) == 2:
				get_parent().get_parent().get_parent().get_parent().get_node("FleeDialog").dialog_text = "Fuga riuscita!"
				get_parent().get_node("SelectCursor").visible = false
				get_parent().get_parent().get_parent().get_parent().get_node("FleeDialog").popup()
				get_parent().get_parent().get_parent().get_parent().get_node("FleeDialog").grab_focus()
				flee = true
			else:
				get_parent().get_parent().get_parent().get_parent().get_node("FleeDialog").dialog_text = "Tentativo di fuga fallito"
				var atkEnemy = int(get_parent().get_parent().get_parent().get_parent().get_node("AtkEnemy").text)
				PlayerProfile.hp = PlayerProfile.hp - atkEnemy
				get_parent().get_node("SelectCursor").visible = false
				if PlayerProfile.hp < 1:
					get_parent().get_parent().get_parent().get_parent().get_node("FleeDialog").dialog_text = "             Hai perso!"
					get_parent().get_parent().get_parent().get_parent().get_node("FleeDialog").get_ok().text = "Torna al Menu"
				get_parent().get_parent().get_parent().get_parent().get_node("FleeDialog").popup()
				get_parent().get_parent().get_parent().get_parent().get_node("FleeDialog").grab_focus()
	else:
		get_parent().get_parent().get_parent().get_parent().get_node("FleeDialog").dialog_text = "Non puoi fuggire ora!"
		get_parent().get_node("SelectCursor").visible = false
		get_parent().get_parent().get_parent().get_parent().get_node("FleeDialog").popup()
		get_parent().get_parent().get_parent().get_parent().get_node("FleeDialog").grab_focus()


func _on_FleeDialog_confirmed():
	get_parent().get_node("SelectCursor").visible = true
	if flee == true:
		ScreenManager.goto_scene("res://beforeBattleSave.tscn")
	if PlayerProfile.hp < 1:
		ScreenManager.goto_scene("res://Scenes/MainMenu.tscn")
