extends State

@export var projectiles: Node2D
@export var alpha: float
@export var spawnTime: float
@export var nextPhase: State
@export var move: Node2D
@export var canMove: bool
@export var moveSpeed: Vector2


func enter():
	super.enter()
	projectiles.alpha = alpha
	projectiles.spawnTime = spawnTime
	if canMove:
		move.horizontalMovement = canMove
		move.velocity = moveSpeed
	else:
		move.horizontalMovement = canMove
		move.velocity = Vector2(0,0)

func transition():
	if can_transition:
		get_parent().change_state(nextPhase.name)


