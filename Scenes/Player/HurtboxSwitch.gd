extends Node2D

@export var modeManager: Node
@export var lightHurtbox: Area2D
@export var shadowHurtbox: Area2D

func _ready():
	switch(modeManager.current_mode)
	modeManager.mode_switch.connect(switch)

func switch(mode):
	if mode == 0:
		print(str(modeManager.current_mode))
		shadowHurtbox.is_invicible = true
		lightHurtbox.is_invicible = false
	else:
		print(str(modeManager.current_mode))
		shadowHurtbox.is_invicible = false
		lightHurtbox.is_invicible = true




