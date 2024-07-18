extends CharacterBody2D
class_name Player
@export var normal_speed = 100.0
@export var acceleration = 100.0
var max_speed

func _ready():
	max_speed = normal_speed
