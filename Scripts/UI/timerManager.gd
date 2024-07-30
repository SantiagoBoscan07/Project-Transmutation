extends Node

@export var label: Label
@export var levelTimer: Timer
var timeLeft
var minutes
var seconds

func _ready():
	levelTimer.start()

func _timeLeft():
	timeLeft = levelTimer.time_left
	minutes = floor(timeLeft / 60)
	seconds = int(timeLeft) % 60
	return [minutes, seconds]

func _process(delta):
	label.text = "Time Left: %02d:%02d" % _timeLeft()
