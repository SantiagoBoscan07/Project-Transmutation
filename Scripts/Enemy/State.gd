extends Node2D
class_name State

@export var projectiles: Node2D
@export var alpha: float
@export var spawnTime: float
@export var move: Node2D
@export var canMove: bool
@export var canShoot: bool
@export var canCollision: bool
@export var moveSpeed: Vector2
@export var nextPhase: State
@export_range(0.1, 10.0) var maxTime: float = 5.0
@export_range(0.1, 10.0) var minTime: float = 0.05
var phaseDuration: float

@onready var debug = owner.find_child("Debug")
@onready var duration = owner.find_child("Duration")

var can_transition: bool = false

func _ready():
	set_physics_process(false)
	duration.timeout.connect(_on_duration_timeout)

func _on_duration_timeout():
	can_transition = true

func enter():
	set_physics_process(true)
	can_transition = false
	projectiles.canShoot = canShoot
	if canShoot:
		projectiles.alpha = alpha
		projectiles.spawnTime = spawnTime
	if canMove:
		if canCollision:
			move.collisionMovement = canCollision
		move.velocity = moveSpeed
	else:
		move.velocity = Vector2(0,0)
	phaseDuration = randf_range(minTime, maxTime)
	duration.wait_time = phaseDuration
	duration.start()

func exit():
	set_physics_process(false)

func transition():
	pass

func _physics_process(delta):
	if can_transition:
		transition()
	debug.text = name
