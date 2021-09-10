extends ConfirmationDialog



# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_cancel().text = "Non ora"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerProfile.coins < 20:
		self.dialog_text = "Costo: 20 monete\nNon hai abbastanza monete"
		self.get_ok().disabled = true
