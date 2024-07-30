extends Node2D


@export var lightArea: Area2D
@export var shadowArea: Area2D


func _ready():
	switch(ModeManager.current_mode)
	ModeManager.mode_switch.connect(switch)

func switch(mode):
	if mode == 0:
		shadowArea.is_invicible = false
		lightArea.is_invicible = true
	elif mode == 1:
		shadowArea.is_invicible = true
		lightArea.is_invicible = false




