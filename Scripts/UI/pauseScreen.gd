extends Control

func _ready():
	hide()

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		if Globals.isPaused:
			Engine.time_scale = 1
			hide()
		else:
			Engine.time_scale = 0
			show()
		Globals.isPaused = !Globals.isPaused
