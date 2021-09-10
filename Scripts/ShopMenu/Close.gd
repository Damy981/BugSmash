extends Label

func callback():
	get_parent().get_parent().get_parent().get_parent().get_parent().queue_free()
	Pause.isPaused = false
