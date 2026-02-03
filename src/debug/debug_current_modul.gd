extends Label

var _original_text: String = "module: #module"

func _on_modul_manager_on_module_change(module_id: String) -> void:
	text = _original_text.replace("#module", module_id)
