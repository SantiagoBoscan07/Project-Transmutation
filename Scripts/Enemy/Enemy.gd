extends CharacterBody2D

@export var health: Health
@export var hurtbox: Hurtbox
@export var flash: Flash
@export var projectileSpawner: Node2D
@export var isShadow: bool = false:
	set(value):
		isShadow = value
@export var upEntrance: bool = false:
	set(value):
		upEntrance = value
@export var leftEntrance: bool = false:
	set(value):
		leftEntrance = value
@export var rightEntrance: bool = false:
	set(value):
		rightEntrance = value
var randomDirection: bool:
	set(value):
		randomDirection = value
@onready var lightSprite = $Body/Sprite/Light
@onready var shadowSprite = $Body/Sprite/Shadow
@onready var hurtSound = $Sounds/Hurt


func _ready():
	hurtbox.hurt.connect(func(hitbox: Hitbox):
		hurtSound.play_with_variance()
		flash._flash()
		)
	health.no_health.connect(die)
	projectileSpawner.isShadow = isShadow
	if isShadow:
		lightSprite.hide()
		shadowSprite.show()
	randomDirection = bool(randi() % 2)

func die():
	MusicManager.playDie()
	queue_free()


func _on_visible_on_screen_enabler_2d_screen_exited():
	print("die")
	queue_free()
