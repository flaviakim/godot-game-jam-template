# globaly available under ControlledAudioUtil see project/project settings/globals
extends Node

const global_audio_muffler: float = 0.5

enum AudioType {
	SFX,
	MUSIC
}

func update_audio_stream_player_volume_db(volume: float, type: AudioType) -> float:
	var adjustment_db = 0.0
	if type == AudioType.SFX:
		if SettingsManager.singleton.sfx_volume <= 0.1:
			adjustment_db = -80
		else:
			adjustment_db = linear_to_db(SettingsManager.singleton.sfx_volume * global_audio_muffler)
	if type == AudioType.MUSIC:
		if SettingsManager.singleton.music_volume <= 0.1:
			adjustment_db = -80
		else:
			adjustment_db = linear_to_db(SettingsManager.singleton.music_volume * global_audio_muffler)
		
	return volume + adjustment_db
