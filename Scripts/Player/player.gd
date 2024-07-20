extends CharacterBody2D
class_name Player
@export var normal_speed = 100.0
@export var acceleration = 100.0
@onready var health = $Components/Health
@onready var flash = $Components/Flash
@onready var hurtbox_light = $Areas/HurtboxLight
@onready var hurtbox_shadow = $Areas/HurtboxShadow

var max_speed

func _ready():
	max_speed = normal_speed
	hurtbox_light.hurt.connect(func(hitbox: Hitbox):
		flash.flash()
		)
	health.no_health.connect(die)


func die():
	queue_free()
