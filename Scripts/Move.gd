extends Node2D
class_name movePlayerComponent
@export var player: CharacterBody2D
var direction: Vector2

func _physics_process(delta):
	direction = Input.get_vector("move_left","move_right","move_up","move_down")
	if direction.length() > 1.0:
		direction = direction.normalized()
	player.velocity.x = move_toward(player.velocity.x, player.max_speed * direction.x, player.acceleration)
	player.velocity.y = move_toward(player.velocity.y, player.max_speed * direction.y, player.acceleration)
	player.move_and_slide()
