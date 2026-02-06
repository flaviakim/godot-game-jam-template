class_name InGameUIController extends CanvasLayer

@onready var pause_btn: Button = $Control/PauseButton
@onready var pause_menu: CanvasLayer = $"../GamePausedController"
@onready var world: Node = $"../world"

var is_paused: bool = false:
	set(value):
		is_paused = value
		if is_paused:
			hide()
			pause_menu.show()
			world.process_mode = Node.PROCESS_MODE_DISABLED
		else:
			show()
			pause_menu.hide()
			world.process_mode = Node.PROCESS_MODE_INHERIT

func _ready() -> void:
	pause_btn.button_up.connect(func(): is_paused = !is_paused)

func _process(_delta: float) -> void:
	if Input.is_action_just_released("pause_game"):
		is_paused = !is_paused
