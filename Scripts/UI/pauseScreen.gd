extends Control

func _ready():
	owner.hide()

func _unhandled_input(event):
	if event.is_action_pressed("pause") and !Globals.isDead:
		if Globals.isPaused:
			MusicManager.pauseMainTheme()
			Engine.time_scale = 1
			owner.hide()
		else:
			MusicManager.pauseMainTheme()
			Engine.time_scale = 0
			owner.show()
		Globals.isPaused = !Globals.isPaused
