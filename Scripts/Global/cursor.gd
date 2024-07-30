extends Node2D

@export var flaskCursor: Sprite2D
var option = 1

func _unhandled_input(event):
	if event.is_action_pressed("move_up") and option == 2:
		if Globals.isPaused or Globals.isDead:
			option -= 1
			flaskCursor.position = Vector2(96,156)
	if event.is_action_pressed("move_down") and option == 1:
		if Globals.isPaused or Globals.isDead:
			option += 1
			flaskCursor.position = Vector2(61,187)
	if event.is_action_pressed("confirm"):
		if Globals.isPaused or Globals.isDead:
			match(option):
				1:
					restartScene()
				2:
					print("option 2")
				_:
					print("something wrong happened, please try again")

func restartScene():
	Engine.time_scale = 1
	Globals.isPaused = false
	Globals.isDead = false
	get_tree().reload_current_scene()
