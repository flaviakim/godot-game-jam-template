class_name MenuBackground extends Node

@export var show_logo: bool = true

@onready var logo: TextureRect = $TextureRect

func _ready() -> void:
	if !show_logo and logo:
		logo.hide()
