extends HSlider

var volume
# Called when the node enters the scene tree for the first time.
func _ready():
	self.min_value = 0.0001
	self.max_value = 1
	self.step = 0.0001
	
	var save_file = File.new()
	if not save_file.file_exists("user://config.save"):
		self.value = 1
	else:
		save_file.open("user://config.save", File.READ)
		volume = save_file.get_double()
		save_file.close()
	
		self.value = volume


func _on_VolumeSlider_value_changed(value):
	volume = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), log(volume) * 20)
	PlayerProfile.volume = volume
