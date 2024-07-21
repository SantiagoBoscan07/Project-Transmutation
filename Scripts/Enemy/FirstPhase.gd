extends State

@export var projectiles: Node2D

func enter():
	super.enter()
	projectiles.alpha = 1.3
	projectiles.spawnTime = 0.08

func transition():
	if can_transition:
		get_parent().change_state("SecondPhase")
