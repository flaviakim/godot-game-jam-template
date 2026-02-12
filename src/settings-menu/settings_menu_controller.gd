class_name SettingsMenuController extends Node

@onready var fullscreen_checkbox: CheckBox = $"../UI/VBoxContainer/Body/Fields/Fullscreen"
@onready var music_slider: Slider = $"../UI/VBoxContainer/Body/Fields/MusicVolume"
@onready var sfx_slider: Slider = $"../UI/VBoxContainer/Body/Fields/SfxVolume"
@onready var ui_slider: Slider = $"../UI/VBoxContainer/Body/Fields/UIScale"
@onready var reset_settings_button: Button = $"../UI/VBoxContainer/ResetSettingsButton"
@onready var main_menu_btn: Button = $"../UI/VBoxContainer/Button"
@onready var ui_scale_change_dialog = $"../UI/UI_Scale_Change_Dialog"

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
			_create_confirmation_dialog()
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

func _create_confirmation_dialog() -> void:
	var dialog: ConfirmationDialog = ui_scale_change_dialog
	var timer: Timer = Timer.new()

	dialog.get_ok_button().button_up.connect(func():
		_dialog_confirm(dialog, timer)
	)
	dialog.get_cancel_button().button_up.connect(func():
		_dialog_cancel(dialog, timer)
	)
	dialog.close_requested.connect(func():
		_dialog_cancel(dialog, timer)
	)
	
	timer.wait_time = 10
	timer.one_shot = true
	timer.timeout.connect(func():
		_dialog_cancel(dialog, timer)
		dialog.hide()
	)
	add_child(timer)

	dialog.popup_centered_clamped(Vector2(400, 100))
	timer.start()

func _dialog_confirm(dialog: ConfirmationDialog, timer: Timer) -> void:
	GlobalSound.singleton.play("UiPlop")
	SettingsManager.save_UI_scale()
	timer.stop()
	timer.queue_free()

func _dialog_cancel(dialog: ConfirmationDialog, timer: Timer) -> void:
	GlobalSound.singleton.play("UiPlop")
	SettingsManager.reset_UI_scale() # TODO should we reset to the default value or just keep the previous value? If keeping the previous value, just comment out this line.
	reset_ui()
	timer.stop()
	timer.queue_free()
