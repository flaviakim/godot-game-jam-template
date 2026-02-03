class_name EnvironmentLabel extends Label

func _ready() -> void:
	var is_editor = ""
	
	if OS.has_feature("editor"): is_editor = " (in godot editor)"
	
	text = text.replace("#environment", OS.get_name() + is_editor)
