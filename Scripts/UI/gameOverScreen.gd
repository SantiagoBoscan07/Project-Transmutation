extends Control


func _ready():
	Signals.gameOver.connect(gameOverShow)
	hide()

func gameOverShow():
	Globals.isDead = true
	show()


