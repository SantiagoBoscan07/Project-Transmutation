extends ColorRect

@export var menu: PackedScene 

func _ready():
	Transition.fadeBlackEnd.connect(goMenu)

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "warning":
		Transition.fadeToBlack()

func goMenu():
	get_tree().change_scene_to_packed(menu)
