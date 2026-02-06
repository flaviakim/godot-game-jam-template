extends Control

@onready var hide_button: Button = $VBoxContainer/hide
@onready var goto_game_button: Button = $VBoxContainer/gotoGame

func _ready() -> void:
	if !OS.has_feature("editor"): hide()
	hide_button.button_up.connect(func(): hide())
	goto_game_button.button_up.connect(func(): ModulManager.singleton.load_module("game"))

func _process(_delta: float) -> void:
	if Input.is_action_just_released("toggle_debug"):
		if visible: hide()
		else: show()
