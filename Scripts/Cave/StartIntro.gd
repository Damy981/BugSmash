extends Node2D

var bdb
var dialogFinished = false
var flag = false
var bdb1


# Called when the node enters the scene tree for the first time.
func _ready():
	bdb = get_parent().get_node("BlockingDialogBox")
	if PlayerProfile.exitedFromCave == "false":
		var player = get_parent().get_node("Player")
		player.position.x = 430
		player.position.y = 410
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_parent().get_node("BlockingDialogBox").active == false && PlayerProfile.firstTutorialFinished == "false" && PlayerProfile.exitedFromCave == "false":
		get_parent().get_node("TutorialDialog").popup_centered()
	if PlayerProfile.firstTutorialFinished == "true" && !dialogFinished && PlayerProfile.exitedFromCave == "false":
		showAfterBattleDialog()
	if dialogFinished && !bdb1.active:
		get_parent().get_node("Tablet").visible = false
	if bdb.active == false && flag == true:
		get_parent().get_node("Tablet").visible = true
		

func showStartDialog():
	bdb = get_parent().get_node("BlockingDialogBox")
	bdb.setCharacterName("Tablet")
	bdb.append_text("Segui le istruzioni che sto per mostrarti e riuscirai a cavartela!", 7)
	setDialogBox("Tablet","Non c’è tempo per spiegarti\nUn bug ci sta per attaccare e avrai bisogno del mio aiuto")
	setDialogBox(PlayerProfile.username,"E cosa sarebbe un tablet?")
	setDialogBox("Tablet","Aggeggio? Come ti permetti maleducato!\nIo sono un Tablet di ultima generazione!")
	setDialogBox(PlayerProfile.username,"Da dove viene questa voce?\nHey!\nMa questo aggeggio parla?!")
	setDialogBox("Tablet","Hey tu!\nSi proprio tu!\nTi sei svegliato finalmente…")
	setDialogBox(PlayerProfile.username,"Dove mi trovo??")
	setDialogBox(PlayerProfile.username,"Cosa…\nCosa è successo?")
	flag = true
	
	
func _on_Starting_Cave_ready():
	if PlayerProfile.exitedFromCave == "false" && PlayerProfile.firstTutorialFinished == "false":
		showStartDialog()

func showAfterBattleDialog():
	get_parent().get_node("Tablet").visible = true
	bdb = get_parent().get_node("BlockingDialogBox")
	bdb1 = get_parent().get_node("BlockingDialogBox")
	bdb1.setCharacterName(PlayerProfile.username)
	bdb1.append_text("Va bene TABLET\nCome vuoi…", 5)
	setDialogBox("Tablet","Io sono un Tablet! Quante volte devo dirtelo!\nPensa a portarci fuori di qui piuttosto")
	setDialogBox(PlayerProfile.username,"D’accordo…\nSe non mi prendono per matto visto che parlo con un aggeggio strano…")
	setDialogBox("Tablet","Io ti aiuterò nel tragitto inviandoti delle notifiche, \nse per qualche motivo hai bisogno di prenderti una pausa \npuoi premere il tasto Esc della tastiera.")
	setDialogBox("Tablet","Prosegui verso sud-est uscendo da qui e lo troverai.")
	setDialogBox("Tablet","Questa caverna si trova nei boschi vicino la grande montagna\nRaggiungi il villaggio vicino, lì ti spiegheremo tutto.")
	setDialogBox(PlayerProfile.username,"Ma cosa significa?\nCos’era quel mostro?")
	setDialogBox("Tablet","Per stavolta l’abbiamo scampata…\nQuesto era uno dei più semplici, presto dovrai imparare a risolverne di più complicati")
	dialogFinished = true


func _on_TutorialDialog_confirmed():
	get_tree().paused = false
	PlayerProfile.firstTutorialFinished = "true"
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
# warning-ignore:return_value_discarded
	ResourceSaver.save("res://beforeBattleSave.tscn", packed_scene)
	ScreenManager.goto_scene("res://Scenes/Battle.tscn")

func setDialogBox(name, text):
	bdb = BlockingDialogBox.new()
	get_parent().add_child(bdb)
	bdb.setCharacterName(name)
	bdb.append_text(text, 5)
