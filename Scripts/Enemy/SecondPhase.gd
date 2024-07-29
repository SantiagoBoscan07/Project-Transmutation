extends State



func enter():
	super.enter()
	if owner.rightEntrance:
		move.velocity.x *= -1
	if owner.upEntrance:
		if owner.randomDirection:
			move.velocity.x *= -1

func transition():
	if can_transition:
		get_parent().change_state(nextPhase.name)
