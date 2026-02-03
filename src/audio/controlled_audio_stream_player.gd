class_name ControlledAudioStreamPlayer2D extends AudioStreamPlayer2D

@export var type: ControlledAudioUtil.AudioType

var base_volume_db: float = 0.0

func _ready() -> void:
	base_volume_db = volume_db
	volume_db = ControlledAudioUtil.update_audio_stream_player_volume_db(base_volume_db, type)
	SettingsManager.singleton.on_volume_changed.connect(func():
		volume_db = ControlledAudioUtil.update_audio_stream_player_volume_db(base_volume_db, type)
		)
	
