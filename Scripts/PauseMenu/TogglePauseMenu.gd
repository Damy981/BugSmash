extends Node2D

const pauseMenuScene = preload("res://Scenes/PauseMenu.tscn")
var pauseMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("pause"):
		if (Pause.isPaused == false):
			pauseMenu = pauseMenuScene.instance()
			Pause.isPaused = true
			$Player.z_index = 1
			$Player/PauseMenu.visible = true
			$Player/PauseMenu/ColorRect/VBoxContainer.add_child(pauseMenu)
		else:
			if $Player/PauseMenu.visible == true:
				Pause.isPaused = false
				$Player.z_index = 0
				pauseMenu.queue_free()
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (Pause.isPaused == false):
		$Player/PauseMenu.visible = false
		$Player.z_index = 0
