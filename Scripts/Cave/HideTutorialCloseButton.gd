extends AcceptDialog

# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_close_button().visible = false

func _on_TutorialDialog_about_to_show():
	get_tree().paused = true
