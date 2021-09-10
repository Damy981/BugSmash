extends StaticBody2D

var bdb
var bdb1
var flag = false  
var timer = 2

const shopMenuScene = preload("res://Scenes/ShopMenu.tscn")
var shopMenu

func _ready():
	bdb = get_parent().get_node("BlockingDialogBox")
	bdb1 = get_parent().get_node("BlockingDialogBox")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Pause.isPaused == false:
		get_parent().get_node("ShopMenu").visible = false
	if bdb1.active == false:
		if timer > 0:
			timer -= delta
			return
		timer = 2
		get_parent().get_node("Player").collider = null
		if flag == true:
			shopMenu = shopMenuScene.instance()
			get_parent().get_node("ShopMenu").visible = true
			get_parent().get_node("ShopMenu/ColorRect/VBoxContainer").add_child(shopMenu)
			Pause.isPaused = true
			flag = false


func showDialog():
	if bdb.active == false:
		bdb1.setCharacterName("Negoziante")
		bdb1.append_text("Come posso esserti utile?", 5)
		setDialogBox("Negoziante","Qui puoi comprare oggetti e funzioni per il tuo tablet")
		setDialogBox("Negoziante","Ciao straniero! Benvenuto nel mio negozio!")
		flag = true

func setDialogBox(name, text):
	bdb = BlockingDialogBox.new()
	get_parent().add_child(bdb)
	bdb.setCharacterName(name)
	bdb.append_text(text, 5)
