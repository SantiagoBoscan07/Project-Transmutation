extends Node2D

@export var flaskCursor: Sprite2D
var option = 1

func _unhandled_input(event):
	if event.is_action_pressed("move_up") and option == 2 and Globals.isPaused:
		option -= 1
		flaskCursor.position = Vector2(96,156)
	if event.is_action_pressed("move_down") and option == 1 and Globals.isPaused:
		option += 1
		flaskCursor.position = Vector2(61,187)
	if event.is_action_pressed("space") and Globals.isPaused:
		match(option):
			1:
				print("option 1")
			2:
				print("option 2")
			_:
				print("something wrong happened, please try again")

