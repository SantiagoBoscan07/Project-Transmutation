extends ColorRect

@onready var animationPlayer = $AnimationPlayer
@onready var fadeToBlackSound = $FadeToBlack
@onready var fadeToScreenSound = $FadeToScreen
signal fadeSceneEnd
signal fadeBlackEnd


func fadeToBlack():
	fadeToBlackSound.play_with_variance()
	animationPlayer.play("fadeToBlack")

func fadeToScene():
	fadeToScreenSound.play_with_variance()
	animationPlayer.play("fadeToScene")



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadeToBlack":
		fadeBlackEnd.emit()
	if anim_name == "fadeToScene":
		fadeSceneEnd.emit()
