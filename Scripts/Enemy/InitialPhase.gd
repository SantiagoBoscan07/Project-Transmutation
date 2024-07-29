extends State

@export var entranceSpeed: float

func enter():
	if owner.upEntrance:
		moveSpeed = Vector2(0,entranceSpeed)
	if owner.rightEntrance:
		moveSpeed = Vector2(entranceSpeed * -1,0)
	if owner.leftEntrance:
		moveSpeed = Vector2(entranceSpeed,0)
	super.enter()


func transition():
	if can_transition:
		get_parent().change_state(nextPhase.name)
