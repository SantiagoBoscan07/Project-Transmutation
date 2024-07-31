extends Node2D

var fadeEnd = false
@export var level1: PackedScene

func _ready():
	Transition.fadeToScene()
	Transition.fadeSceneEnd.connect(startGame)
	Transition.fadeBlackEnd.connect(startLevel)
	MusicManager.playTitleScreen()

func _unhandled_input(event):
	if event.is_action_pressed("confirm") and fadeEnd:
		Transition.fadeToBlack()

func startGame():
	fadeEnd = true

func startLevel():
	MusicManager.stopTitleScreen()
	get_tree().change_scene_to_packed(level1)
