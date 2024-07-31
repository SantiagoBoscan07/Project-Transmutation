extends ColorRect

@export var menu: PackedScene

func _ready():
	Transition.fadeToScene()
	Transition.fadeSceneEnd.connect(startAnimation)
	Transition.fadeBlackEnd.connect(backToMenu)
	MusicManager.playCredit()


func startAnimation():
	$AnimationPlayer.play("credits")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "credits":
		MusicManager.stopCredit()
		Transition.fadeToBlack()

func backToMenu():
	get_tree().change_scene_to_packed(menu)
