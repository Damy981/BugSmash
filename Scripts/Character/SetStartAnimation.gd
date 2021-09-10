extends AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerProfile.gender == "male":
		self.animation = "male_stand_down"
	elif PlayerProfile.gender == "female":
		self.animation = "female_stand_down"
