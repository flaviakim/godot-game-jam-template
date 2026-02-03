class_name GlobalSound extends Node

var _sound_map: Dictionary

static var singleton: GlobalSound

func _ready() -> void:
	_sound_map = {}
	for c in get_children():
		if c is AudioStreamPlayer:
			_sound_map.set(c.name, c)
		if c is AudioStreamPlayer2D:
			_sound_map.set(c.name, c)
		if c is ControlledAudioStreamPlayer:
			_sound_map.set(c.name, c)
		if c is ControlledAudioStreamPlayer2D:
			_sound_map.set(c.name, c)
			
	singleton = self
			
func play(id: String) -> void:
	if !_sound_map.has(id):
		Debug.singleton.error("sound: " + id + " does not exist!")
		return
		
	_sound_map.get(id).play()
