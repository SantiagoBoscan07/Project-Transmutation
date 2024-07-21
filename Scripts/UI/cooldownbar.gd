extends Control
@export var progressBar: TextureProgressBar
@export var progressTimer: Timer
@export var updateTimer: Timer
var fillTime = 0


func _ready():
	progressBar.value = 0
	progressTimer.wait_time = 0.05
	updateTimer.wait_time = 0.05
	Signals.dashCooldownBar.connect(cooldown_value)
	Signals.dashBar.connect(update_value)


func update_value(time):
	show()
	progressBar.value = 0
	fillTime = time
	updateTimer.start()


func cooldown_value(time):
	show()
	progressBar.value = 100
	fillTime = time
	progressTimer.start()


func _on_progress_time_timeout():
	if progressBar.value > 0:
		progressTimer.start()
		progressBar.value -= progressBar.max_value * (progressTimer.wait_time / fillTime)
	else:
		progressBar.value = 0
		progressTimer.stop()


func _on_update_timer_timeout():
	if progressBar.value < 100:
		updateTimer.start()
		progressBar.value += progressBar.max_value * (progressTimer.wait_time / fillTime)
	else:
		progressBar.value = 100
		updateTimer.stop()
