extends Node
class_name MoveObject

@export var body: CharacterBody2D
@export var velocity: Vector2:
	set(value):
		velocity = value
@export var collisionMovement: bool = false:
	set(value):
		collisionMovement = value

func _physics_process(delta):
	body.translate(velocity * delta)
	if collisionMovement:
		if body.position.x <= 25 || body.position.x >= 290:
			velocity.x *= -1
