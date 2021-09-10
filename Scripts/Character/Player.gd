extends KinematicBody2D

var gender
var existBox = false
var collider = null
var rayCast
# Called when the node enters the scene tree for the first time.
func _ready():
	gender = PlayerProfile.gender
	rayCast = get_node("RayCast2D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity
	
	if (Pause.isPaused == true):
		velocity = Vector2()   #stop animation when pausing
	if (Pause.isPaused == false):
		velocity = Vector2()
	
		if Input.is_key_pressed(KEY_UP):
			velocity.y = -1
			rayCast.cast_to = Vector2(0, -70)
		if Input.is_key_pressed(KEY_DOWN):
			velocity.y = 1
			rayCast.cast_to = Vector2(0, 70)
		if Input.is_key_pressed(KEY_LEFT):
			velocity.x = -1
			rayCast.cast_to = Vector2(-70, 0)
		if Input.is_key_pressed(KEY_RIGHT):
			velocity.x = 1
			rayCast.cast_to = Vector2(70, 0)
			
		if rayCast.is_colliding() && collider == null:
			if rayCast.get_collider().get_name() == "VillageChief":
				get_parent().get_node("VillageChief").get_node("PressEnter").visible = true
			if Input.is_action_just_released("ui_accept"):
				collider = rayCast.get_collider().get_name()
				select_right_dialog()
		
	var box = get_parent().get_node("BlockingDialogBox")
	if box != null:
		existBox = true
	
	var movement = 250*velocity.normalized()*delta
# warning-ignore:return_value_discarded

	if existBox == false:
		self.move_and_collide(movement)
	
		if gender == "male":
			self.update_male_animation(velocity)
		elif gender == "female":
			self.update_female_animation(velocity)
			
	elif existBox == true && box.active == false:
# warning-ignore:return_value_discarded
		self.move_and_collide(movement)
	
		if gender == "male":
			self.update_male_animation(velocity)
		elif gender == "female":
			self.update_female_animation(velocity)
	
	
func update_male_animation(velocity):
	if velocity.y == 1:
		$AnimatedSprite.play("male_walk_down")
	elif velocity.y == -1:
		$AnimatedSprite.play("male_walk_up")
	elif velocity.x == 1:
		$AnimatedSprite.play("male_walk_left")
		$AnimatedSprite.flip_h = true
	elif velocity.x == -1:
		$AnimatedSprite.play("male_walk_left")
		$AnimatedSprite.flip_h = false
	
	if velocity == Vector2():
		if $AnimatedSprite.animation == "male_walk_down":
			$AnimatedSprite.play("male_stand_down")
		elif $AnimatedSprite.animation == "male_walk_up":
			$AnimatedSprite.play("male_stand_up")
		elif $AnimatedSprite.animation == "male_walk_left":
			$AnimatedSprite.play("male_stand_left")

func update_female_animation(velocity):
	if velocity.y == 1:
		$AnimatedSprite.play("female_walk_down")
	elif velocity.y == -1:
		$AnimatedSprite.play("female_walk_up")
	elif velocity.x == 1:
		$AnimatedSprite.play("female_walk_left")
		$AnimatedSprite.flip_h = true
	elif velocity.x == -1:
		$AnimatedSprite.play("female_walk_left")
		$AnimatedSprite.flip_h = false
	
	if velocity == Vector2():
		if $AnimatedSprite.animation == "female_walk_down":
			$AnimatedSprite.play("female_stand_down")
		elif $AnimatedSprite.animation == "female_walk_up":
			$AnimatedSprite.play("female_stand_up")
		elif $AnimatedSprite.animation == "female_walk_left":
			$AnimatedSprite.play("female_stand_left")


func select_right_dialog():
	match collider:
		"InnKeeper":
			if get_parent().get_node("InnKeeper").blackShown == false:
				get_parent().get_node("InnKeeper").showDialog()
		"Shop_Assistant":
			get_parent().get_node("Shop_Assistant").showDialog()
		"VillageChief":
			if Quests.bridgeQuestCurrent < 5:
				get_parent().get_node("VillageChief").get_node("PressEnter").visible = false
				get_parent().get_node("VillageChief").showDialog()
			else:
				get_parent().get_node("VillageChief").showDialogQuestCompleted()
		"Npc1": #tizia vicino locanda
			get_parent().get_node("Npc1").showDialog()
		"Npc2": #tizio vicino negozio
			get_parent().get_node("Npc2").showDialog()
		"Npc3": #vecchietto in alto
			get_parent().get_node("Npc3").showDialog()
		"Npc5": #tizia afro al centro
			get_parent().get_node("Npc5").showDialog()
