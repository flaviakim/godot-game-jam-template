class_name GlobalSound extends Node

var _sound_map: Dictionary

static var singleton: GlobalSound

func _ready() -> void:
	_sound_map = {}
	for c in get_children():
		if c is AudioStreamPlayer:
			c.bus = "SFX"
			_sound_map.set(c.name, c)
		if c is AudioStreamPlayer2D:
			c.bus = "SFX"
			_sound_map.set(c.name, c)
		if c is AudioStreamPlayer3D:
			c.bus = "SFX"
			_sound_map.set(c.name, c)
			
	singleton = self
			
func play(id: String) -> void:
	if !_sound_map.has(id):
		Debug.error("sound: " + id + " does not exist!")
		return
		
	_sound_map.get(id).play()
