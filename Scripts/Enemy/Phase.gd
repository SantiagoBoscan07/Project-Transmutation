extends State


func enter():
	super.enter()
	if canMove:
		move.collisionMovement = canMove
		move.velocity = moveSpeed
	else:
		move.horizontalMovement = canMove
		move.velocity = Vector2(0,0)

func transition():
	if can_transition:
		get_parent().change_state(nextPhase.name)


