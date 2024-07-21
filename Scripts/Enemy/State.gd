extends Node2D
class_name State

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
	duration.start()

func exit():
	set_physics_process(false)

func transition():
	pass

func _physics_process(delta):
	if can_transition:
		print("Transition")
		transition()
	debug.text = name
