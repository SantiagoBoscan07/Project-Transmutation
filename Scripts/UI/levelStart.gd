extends Node
class_name levelStart

@export var firstWave: Node2D

func _ready():
	Transition.fadeToScene()
	Transition.fadeSceneEnd.connect(startLevel)

func startLevel():
	firstWave.process_mode = 0
