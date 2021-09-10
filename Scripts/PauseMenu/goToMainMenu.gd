extends Label

func callback():
	ScreenManager.goto_scene("res://Scenes/MainMenu.tscn")
	Pause.isPaused = false
