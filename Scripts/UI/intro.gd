extends ColorRect

var menu: PackedScene = load("res://Scenes/Levels/level1.tscn")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "warning":
		get_tree().change_scene_to_packed(menu)
