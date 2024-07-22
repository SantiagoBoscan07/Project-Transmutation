extends Node2D

@onready var lightHitbox = $"../LightHitbox"
@onready var shadowHitbox = $"../ShadowHitbox"
var isShadow: bool

func _ready():
	isShadow = owner.isShadow
	if isShadow:
		lightHitbox.cannot_hit = true
		shadowHitbox.cannot_hit = false
	else:
		lightHitbox.cannot_hit = false
		shadowHitbox.cannot_hit = true
