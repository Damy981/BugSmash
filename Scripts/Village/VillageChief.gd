extends StaticBody2D

var bdb
var bdb1
var timer = 2
var flag = false

# Called when the node enters the scene tree for the first time.
func _ready():
	bdb = get_parent().get_node("BlockingDialogBox")
	bdb1 = get_parent().get_node("BlockingDialogBox")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bdb1.active == false:
		if timer > 0:
			timer -= delta
			return
		timer = 2
		get_parent().get_node("Player").collider = null
	if flag && !bdb1.active:
		print("ciao")
		get_parent().get_node("CanvasLayer/AcceptDialog").popup_centered()
		flag = false
			
func setDialogBox(name, text):
	bdb = BlockingDialogBox.new()
	get_parent().add_child(bdb)
	bdb.setCharacterName(name)
	bdb.append_text(text, 5)
	
func showDialog():
	if bdb.active == false:
		bdb1.setCharacterName("Capo Villaggio")
		bdb1.append_text("Torna qui da me quando hai fatto, \nBuona fortuna e fai attenzione!", 5)
		setDialogBox("Capo Villaggio","Per permettere al nostro falegname di ripararlo \ndovrai sconfiggere un po’ di bug nel bosco per liberagli la strada.")
		setDialogBox("Capo Villaggio","Hai notato il ponte sul fiume distrutto? \nLa montagna si trova al di là di quel corso d’acqua, \nquell’abominio ha bloccato l’unica via di accesso al suo territorio così che \nnessuno potesse disturbarlo e ha infettato chiunque gli capitasse a tiro rendendolo suo schiavo! ")
		setDialogBox("Capo Villaggio","Ti basterà percorrere la via principale \ne poi seguire le indicazioni per arrivarci")
		setDialogBox("Capo Villaggio","In questo villaggio troverai tutto quello che ti serve \nper prepararti ad affrontare al meglio il boss, disponiamo di un negozio \nin cui potrai acquistare degli aiuti e di una locanda in cui riposarti \ndopo le tue dure battaglie")
		setDialogBox(PlayerProfile.username ,"Io non...")
		setDialogBox("Capo Villaggio","Ti stavamo aspettando fin dal giorno il cui quel mostro \nè sceso dal cielo ad infettare tutti e si è rifugiato nella montagna!")
		setDialogBox("Capo Villaggio","Benvenuto straniero, \ntu devi essere ‘il Prescelto’, colui che ci libererà dal virus!")
		flag = true
		Quests.bridgeQuestActive = "true"

func showDialogQuestCompleted():
	if bdb.active == false:
		bdb1.setCharacterName("Capo Villaggio")
		bdb1.append_text("Ah e se ti serve qualcosa,\nnoi siamo qui!", 7)
		setDialogBox("Capo Villaggio","Bene straniero, \nil nostro falegname è riuscito a riparare il ponte! Fai buon viaggio")
		Quests.bridgeQuestCompleted = "true"
