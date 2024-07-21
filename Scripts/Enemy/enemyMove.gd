extends Node

@export var body: CharacterBody2D
@export var velocity: Vector2:
	set(value):
		velocity = value
@export var horizontalMovement: bool = false:
	set(value):
		horizontalMovement = value
@export var verticalMovement: bool = false:
	set(value):
		verticalMovement = value

func _physics_process(delta):
	if horizontalMovement:
		body.translate(velocity * delta)
		if body.position.x <= 50 || body.position.x >= 250:
			velocity.x *= -1
