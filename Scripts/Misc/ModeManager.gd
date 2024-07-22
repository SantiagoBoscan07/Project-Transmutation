extends Node

signal mode_switch(new_mode)

enum GameModes
{
	LIGHT_MODE,
	SHADOW_MODE
}

var current_mode = GameModes.LIGHT_MODE:
	set(value):
		current_mode = value
		mode_switch.emit(value)


func _unhandled_input(event):
	if event.is_action_pressed("switch_mode"):
		switch_mode()


func switch_mode():
	var new_mode = (current_mode + 1) % GameModes.size()
	current_mode = new_mode
