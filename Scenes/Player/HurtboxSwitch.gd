extends Node2D


@export var lightHurtbox: Area2D
@export var shadowHurtbox: Area2D

func _ready():
	switch(ModeManager.current_mode)
	ModeManager.mode_switch.connect(switch)

func switch(mode):
	if mode == 0:
		shadowHurtbox.is_invicible = false
		lightHurtbox.is_invicible = true
	elif mode == 1:
		shadowHurtbox.is_invicible = true
		lightHurtbox.is_invicible = false




