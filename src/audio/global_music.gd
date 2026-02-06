class_name GlobalMusic extends Node

static var singleton: GlobalMusic

var music_tracks: Dictionary

var _current_track

func _ready() -> void:
	singleton = self
	
	music_tracks = {}
	for c in get_children():
		if c is AudioStreamPlayer:
			c.bus = "Music"
			music_tracks.set(c.name, c)
		if c is AudioStreamPlayer2D:
			c.bus = "Music"
			music_tracks.set(c.name, c)
		if c is AudioStreamPlayer3D:
			c.bus = "Music"
			music_tracks.set(c.name, c)

func play(id: String) -> void:
	# skip if is already playing
	if _current_track and _current_track.name == id: return
	
	stop()
		
	if !music_tracks.has(id):
		Debug.singleton.error("music track: " + id + " does not exist!")
		return
		
	_current_track = music_tracks.get(id)
	_current_track.play()
	
func stop() -> void:
	if _current_track:
		_current_track.stop()
		_current_track = null
