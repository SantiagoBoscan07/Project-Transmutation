extends Control

@export var healthBar: Label
@export var player: CharacterBody2D
var healthPoints

func _ready():
	setHealth()
	player.health.health_changed.connect(setHealth)

func setHealth():
	healthPoints = player.health.health
	if healthPoints < 0:
		healthPoints = 0
	healthBar.text = "HP:\n" + str(healthPoints)
