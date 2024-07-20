extends CharacterBody2D
class_name Player
@export var normal_speed = 100.0
@export var acceleration = 100.0
@onready var health = $Components/Health

var max_speed

func _ready():
	max_speed = normal_speed
	health.no_health.connect(die)

func die():
	queue_free()
