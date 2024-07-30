extends Panel

@export var label: Label
@export var levelTimer: Timer
@export var levelTime: float
@export var nextScene: PackedScene
var timeLeft
var minutes
var seconds

func _ready():
	Transition.fadeBlackEnd.connect(nextLevel)
	levelTimer.wait_time = levelTime
	levelTimer.start()

func _timeLeft():
	timeLeft = levelTimer.time_left
	minutes = floor(timeLeft / 60)
	seconds = int(timeLeft) % 60
	return [minutes, seconds]

func _process(delta):
	label.text = "Time Left: %02d:%02d" % _timeLeft()

func nextLevel():
	get_tree().change_scene_to_packed(nextScene)

func _on_level_timer_timeout():
	MusicManager.stopMainTheme()
	Transition.fadeToBlack()
