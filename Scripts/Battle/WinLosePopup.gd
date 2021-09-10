extends AcceptDialog

func _ready():
	self.get_close_button().visible = false


func _on_WinLosePopup_about_to_show():
	get_tree().paused = true
