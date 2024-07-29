extends State


func enter():
	super.enter()


func transition():
	if can_transition:
		get_parent().change_state(nextPhase.name)
