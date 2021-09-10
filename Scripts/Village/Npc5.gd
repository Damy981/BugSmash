extends StaticBody2D

var bdb
var bdb1
var timer = 2


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

func setDialogBox(name, text):
	bdb = BlockingDialogBox.new()
	get_parent().add_child(bdb)
	bdb.setCharacterName(name)
	bdb.append_text(text, 5)
	
func showDialog():
	if bdb.active == false:
		bdb1.setCharacterName("Abitante")
		bdb1.append_text("Anche ai guerrieri più valorosi capita di avere dei dubbi, \nper ogni evenienza dovresti trovare la sezione aiuto \nnel menù di pausa del tuo tablet", 5)
		setDialogBox("Abitante","La profezia narra:\n“il Prescelto un tablet incontrerà che per lo scontro finale lo addestrerà”… ")
