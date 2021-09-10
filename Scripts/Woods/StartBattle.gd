extends TileMap

var positionX
var positionY
var x
var y
var frameChanged = false
var timer = 4

func _ready():
	setVariables()
	randomize()
	
func _process(delta):
	if timer > 0:
		timer -= delta
		return
	if int(get_parent().get_node("Player").position.x) % 40 == x && frameChanged == true:
		start_combat()
		x += 2
	if int(get_parent().get_node("Player").position.y) % 40 == y && frameChanged == true:
		start_combat()
		y += 2
func start_combat():
	if int(rand_range(1,10)) == 3:
		timer = 4
		frameChanged = false
		var packed_scene = PackedScene.new()
		packed_scene.pack(get_tree().get_current_scene())
# warning-ignore:return_value_discarded
		ResourceSaver.save("res://beforeBattleSave.tscn", packed_scene)
		ScreenManager.goto_scene("res://Scenes/Battle.tscn")


func _on_AnimatedSprite_frame_changed():
	frameChanged = true
	
func setVariables():
	positionX = get_parent().get_node("Player").position.x
	positionY = get_parent().get_node("Player").position.y
	x = int(positionX) % 40 + 2
	y = int(positionY) % 40 + 2
