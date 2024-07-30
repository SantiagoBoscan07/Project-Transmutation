extends Control

func _ready():
	hide()

func _unhandled_input(event):
	if event.is_action_pressed("pause") and !Globals.isDead:
		if Globals.isPaused:
			MusicManager.pauseMainTheme()
			Engine.time_scale = 1
			hide()
		else:
			MusicManager.pauseMainTheme()
			Engine.time_scale = 0
			show()
		Globals.isPaused = !Globals.isPaused
