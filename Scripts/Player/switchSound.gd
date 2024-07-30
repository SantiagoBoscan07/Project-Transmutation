extends Node

@onready var switchSound = $"../../Sounds/Switch"

func _unhandled_input(event):
	if event.is_action_pressed("switch_mode"):
		switchSound.play_with_variance()
