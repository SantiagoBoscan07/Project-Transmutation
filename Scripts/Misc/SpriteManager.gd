extends Node
class_name spriteManager

@export var lightSprite: Sprite2D
@export var shadowSprite: Sprite2D

func _ready():
	switch(ModeManager.current_mode)
	ModeManager.mode_switch.connect(switch)

func switch(mode):
	if mode == 0:
		lightSprite.show()
		shadowSprite.hide()
	elif mode == 1:
		lightSprite.hide()
		shadowSprite.show()
