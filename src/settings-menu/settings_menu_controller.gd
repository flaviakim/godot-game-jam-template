class_name SettingsMenuController extends Node

@onready var fullscreen_checkbox: CheckBox = $"../UI/VBoxContainer/Body/Fields/Fullscreen"
@onready var music_slider: Slider = $"../UI/VBoxContainer/Body/Fields/MusicVolume"
@onready var sfx_slider: Slider = $"../UI/VBoxContainer/Body/Fields/SfxVolume"
@onready var ui_slider: Slider = $"../UI/VBoxContainer/Body/Fields/UIScale"
@onready var reset_settings_button: Button = $"../UI/VBoxContainer/ResetSettingsButton"
@onready var main_menu_btn: Button = $"../UI/VBoxContainer/Button"

func _ready() -> void:
	fullscreen_checkbox.button_pressed = SettingsManager.fullscreen
	fullscreen_checkbox.toggled.connect(func(value): SettingsManager.fullscreen = value)
	
	music_slider.value = SettingsManager.music_volume
	music_slider.value_changed.connect(func(value_changed):
		if value_changed:
			SettingsManager.music_volume = music_slider.value
		)
	
	sfx_slider.value = SettingsManager.sfx_volume
	sfx_slider.drag_ended.connect(func(value_changed: float): 
		if value_changed:
			GlobalSound.singleton.play("UiPlop")
			SettingsManager.sfx_volume = sfx_slider.value
	)	
	
	ui_slider.value = SettingsManager.ui_scale
	ui_slider.drag_ended.connect(func(value_changed: float): 
		if value_changed:
			SettingsManager.ui_scale = ui_slider.value
			var dialog: Window = ConfirmationDialog.new()
			add_child(dialog)
			dialog.dialog_text = "UI scale changed. Do you want to save this setting?"
			dialog.ok_button_text = "Save"
			dialog.cancel_button_text = "Reset"
			dialog.get_ok_button().button_up.connect(func():
				GlobalSound.singleton.play("UiPlop")
				SettingsManager.save_UI_scale()
				remove_child(dialog)
			)
			dialog.get_cancel_button().button_up.connect(func():
				GlobalSound.singleton.play("UiPlop")
				SettingsManager.reset_UI_scale() # TODO should we reset to the default value or just keep the previous value? If keeping the previous value, just comment out this line.
				reset_ui()
				remove_child(dialog)
			)
			dialog.popup_centered_clamped(Vector2(400, 100))
	)
	
	reset_settings_button.button_up.connect(func():
		GlobalSound.singleton.play("UiPlop")
		SettingsManager.reset_settings()
		reset_ui()
	)
	
	UiUtils.connect_button_to_scene_load(main_menu_btn, load("res://src/main-menu/main_menu.tres"))

func reset_ui() -> void:
	fullscreen_checkbox.button_pressed = SettingsManager.fullscreen
	music_slider.value = SettingsManager.music_volume
	sfx_slider.value = SettingsManager.sfx_volume
	ui_slider.value = SettingsManager.ui_scale
