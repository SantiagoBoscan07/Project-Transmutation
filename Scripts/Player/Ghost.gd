extends Node2D

@onready var lightSprite = $LightSprite
@onready var shadowSprite = $ShadowSprite


func _ready():
	switch(ModeManager.current_mode)
	ModeManager.mode_switch.connect(switch)
	ghosting()

func set_property(tx_pos, tx_scale):
	position = tx_pos
	scale = tx_scale

func ghosting():
	var tween_fade = get_tree().create_tween()
	tween_fade.tween_property(self, "self_modulate", Color(1,1,1,0), 0.75)
	await tween_fade.finished
	queue_free()

func switch(mode):
	if mode == 0:
		lightSprite.show()
		shadowSprite.hide()
	elif mode == 1:
		lightSprite.hide()
		shadowSprite.show()
