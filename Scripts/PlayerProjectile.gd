extends Node2D


var speed = 500.0
var direction: Vector2 = Vector2.UP
var velocity: Vector2 = Vector2.ZERO


func _ready():
	set_as_top_level(true)
	velocity = direction * speed


func _process(delta):
	global_position += velocity * delta




func _on_visible_on_screen_enabler_2d_screen_exited():
	print("exited")
	queue_free()
