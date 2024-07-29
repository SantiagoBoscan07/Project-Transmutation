extends Label

@onready var animationPlayer = $AnimationPlayer
@export var nextWave: Node2D





func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadeIn":
		animationPlayer.play("fadeOut")
		if nextWave:
			nextWave.process_mode = 0
