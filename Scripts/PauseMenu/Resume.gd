extends Label

func callback():
	Pause.isPaused = false
	get_parent().get_parent().get_parent().get_parent().get_parent().queue_free()
