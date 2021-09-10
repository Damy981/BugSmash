extends StaticBody2D

var bdb
var bdb1
var flag = false
var timer = 3
var blackShown = false
# Called when the node enters the scene tree for the first time.
func _ready():
	bdb = get_parent().get_node("BlockingDialogBox")
	bdb1 = get_parent().get_node("BlockingDialogBox")
	get_parent().get_node("ConfirmationDialog").get_close_button().visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bdb1.active == false:
		get_parent().get_node("Player").collider = null
		if flag == true:
			get_parent().get_node("ConfirmationDialog").popup()
			flag = false
	if blackShown == true:
		if timer > 0:
			timer -= delta
			return
		else:
			get_parent().get_node("TileMap_Black").hide()
			blackShown = false
			timer = 3
			get_parent().get_node("Background_Music").play()
			

func setDialogBox(name, text):
	bdb = BlockingDialogBox.new()
	get_parent().add_child(bdb)
	bdb.setCharacterName(name)
	bdb.append_text(text, 5)
	
func showDialog():
	if bdb.active == false:
		bdb1.setCharacterName("Locandiere")
		bdb1.append_text("Vuoi riposare ora?", 5)
		setDialogBox("Locandiere","Una stanza ti costerà 20 monete,\nRiposando recupererai tutti i tuoi HP.")
		setDialogBox("Locandiere","Benvenuto nella mia locanda, forestiero!")
		flag = true
				
func _on_ConfirmationDialog_confirmed():
	PlayerProfile.hp = 15
	PlayerProfile.coins = PlayerProfile.coins - 20
	get_parent().get_node("TileMap_Black").show()
	blackShown = true
	get_parent().get_node("Sleep_Sound").play()
	get_parent().get_node("Background_Music").stop()

func _on_ConfirmationDialog_about_to_show():
	get_tree().paused = true


func _on_ConfirmationDialog_popup_hide():
	get_tree().paused = false
