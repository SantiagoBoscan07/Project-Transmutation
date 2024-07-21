extends State

@export var projectiles: Node2D

func enter():
	super.enter()
	projectiles.alpha = 1.6
	projectiles.spawnTime = 0.05

func transition():
	if can_transition:
		get_parent().change_state("FirstPhase")
