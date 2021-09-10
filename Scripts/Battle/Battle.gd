extends Node2D

var monsters_data
var monsters_number
var nameFont
var instructions = []
var hpEnemy
var atkEnemy
var enemyIndex
var functions = []
var funcNames = []
var flag = false
var win = false

func _input(event):
	if event.is_action_pressed("pause"):
		$"CommandList/VBoxContainerM/MenuEntries/SelectCursor/option_confirm_sound".play()
		$"CommandList/VBoxContainerM/MenuEntries/SelectCursor/".active = true
		$"Options/VBoxContainerM/MenuEntries/OptionCursor".active = false
		$ShowFunctionsButton.text = "FUNZIONI"
		for member in get_tree().get_nodes_in_group("BattleSubMenu"):
			member.visible = false

func _ready():
	initializeBattle()
	var save_file = File.new()
	if not save_file.file_exists("user://functions.save"):
		return
	save_file.open("user://functions.save", File.READ)
	
	while (!save_file.eof_reached()):
		var function = save_file.get_var()
		functions.append(function)
		
	save_file.close()
	functions.remove(len(functions) - 1)
	
	for f in functions:
		funcNames.append(f.Name)

func initializeBattle():
	randomize()
	nameFont = DynamicFont.new()
	nameFont.font_data = load("res://Assets/VERDANAB.TTF")
	nameFont.size = 20
	var monsterdata_file = File.new()
	monsterdata_file.open("res://enemies.json", File.READ)

	var monsterdata_json = JSON.parse(monsterdata_file.get_as_text())
	monsterdata_file.close()
	monsters_data = monsterdata_json.result
	monsters_number = monsters_data.size()
	enemyIndex = int(rand_range(2,7))
	
	if PlayerProfile.exitedFromCave == "false":
		enemyIndex = 0
	elif PlayerProfile.secondTutorialFinished == "false":
		enemyIndex = 1
	
	var enemy = monsters_data[enemyIndex]
	
	var sprite = Sprite.new()
	sprite.texture = load(enemy["sprite"])
	sprite.position.x = 570
	sprite.position.y = 300
	sprite.scale.x = 6
	sprite.scale.y = 6
	self.add_child(sprite)
	
	hpEnemy = int(enemy["hp"])
	atkEnemy = int(enemy["atk"])
	
	$HpEnemy.text = "PV: " + str(hpEnemy)
	$AtkEnemy.text = "ATT: " + str(atkEnemy)
	
	for option in enemy["options"]:
		var label = Label.new()
		label.text = option
		label.add_font_override("font", nameFont)
		$Options/VBoxContainerM/MenuEntries.add_child(label)


func _on_Attack_button_up():
	flag = false
	for node in $CodeHistory/VBoxContainerM/MenuEntries.get_children():
		var text = node.text
		if node.text in funcNames:
			for f in functions:
				if f.Name == node.text:
					text = "Atk = " + str(f.Result)
					flag = true
		instructions.append(text)
	print(instructions)
	
	var atk = 2
	var operatorIndex = 10
	var numberIndex = 12
	
	if enemyIndex == 0 || flag == true:
		operatorIndex = 4
		numberIndex = 6
	
	for i in instructions.size():
		var operator = instructions[i][operatorIndex]
		var x = int(instructions[i].right(numberIndex))

		match operator:
			"+":
				atk = atk + x
				print(atk)
			"-":
				atk = atk - x
				print(atk)
			"*":
				atk = atk * x
				print(atk)
			"/":
				atk = atk / x
				print(atk)
			"=":
				atk = x
				print(atk)

	if atk == hpEnemy:
		$CorrectAnswerSound.play()
		if enemyIndex == 1:
			PlayerProfile.secondTutorialFinished = "true"
		PlayerProfile.coins += 10
		if Quests.bridgeQuestActive == "true" && Quests.bridgeQuestCurrent < 5:
			Quests.bridgeQuestCurrent = Quests.bridgeQuestCurrent + 1
		win = true
		$WinLosePopup.dialog_text = "\n\n        Nemico sconfitto!"
		$WinLosePopup.get_ok().text = "Continua"
		$WinLosePopup.popup()
	else:
		PlayerProfile.hp = PlayerProfile.hp - atkEnemy
		$WrongAnswerSound.play()
		if PlayerProfile.hp < 1:
			$WinLosePopup.dialog_text = "\n\n             Hai perso!"
			$WinLosePopup.get_ok().text = "Torna al Menu"
			$WinLosePopup.popup()

	$Attack.release_focus()
	instructions = []
	$CommandList/VBoxContainerM/MenuEntries/SelectCursor/option_confirm_sound.play()


func _on_WinLosePopup_confirmed():
	get_tree().paused = false
	if win:
		ScreenManager.goto_scene("res://beforeBattleSave.tscn")
	else:
		ScreenManager.goto_scene("res://Scenes/MainMenu.tscn")
