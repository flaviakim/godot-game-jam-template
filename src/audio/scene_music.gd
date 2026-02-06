class_name SceneMusic extends Node

# if empty string, the scene will stop any currently playing music
@export var music_id: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if music_id.length() > 0:
		GlobalMusic.singleton.play(music_id)
	else:
		GlobalMusic.singleton.stop()
