extends CharacterBody2D

@export var health: Health
@export var hurtbox: Hurtbox
@export var flash: Flash

func _ready():
	hurtbox.hurt.connect(func(hitbox: Hitbox):
		flash.flash()
		)
	health.no_health.connect(die)

func die():
	queue_free()
