extends AcceptDialog

func _ready():
	if PlayerProfile.thirdTutorialFinished == "false":
		self.call_deferred("popup")
		PlayerProfile.thirdTutorialFinished = "true"
