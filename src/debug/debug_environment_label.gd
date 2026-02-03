class_name EnvironmentLabel extends Label

func _ready() -> void:
	var is_editor = ""
	
	if OS.has_feature("editor"): is_editor = " (in godot editor)"
	
	if EnvUtils.is_web():
		text = text.replace("#environment", EnvUtils.Hosts.keys()[EnvUtils.get_web_os()])
	else:
		text = text.replace("#environment", OS.get_name() + is_editor)
	
