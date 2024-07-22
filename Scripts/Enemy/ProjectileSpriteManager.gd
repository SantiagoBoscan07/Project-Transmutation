extends Node

@onready var lightSprtite = $"../LightProjectile"
@onready var shadowSprite = $"../DarkProjectile"
var isShadow: bool

func _ready():
	isShadow = owner.isShadow
	if isShadow:
		shadowSprite.show()
		lightSprtite.hide()
	else:
		lightSprtite.show()
		shadowSprite.hide()
