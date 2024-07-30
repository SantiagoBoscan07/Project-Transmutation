extends Sprite2D
var option = 1
var isPaused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
			
		if event.is_action_pressed("move_up") and option == 2:
			option -= 1
			position.y -= 25
			
		if event.is_action_pressed("move_down") and option == 1:
			option += 1
			position.y += 25
			
		if event.is_action_pressed("space"):
			match(option):
				1:
					print("option 1")
				2:
					print("option 2")
				_:
					print("something wrong happened, please try again")
		
		
		
