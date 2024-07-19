extends Node2D
class_name dashPlayerComponent
@export var player: CharacterBody2D
@export var boostTimer: Timer
@export var ghost_node: PackedScene
@export var sprite: Sprite2D
@onready var ghost_timer = $"../../Timers/GhostTimer"
var canDash: bool = true
var boostSpeed
var ghost


func _physics_process(delta):
	if Input.is_action_pressed("dash") and canDash:
		boost()


func boost():
	sprite.modulate.a = 150.0 / 250.0
	ghost_timer.start()
	boostSpeed = player.max_speed * 2
	player.max_speed = boostSpeed
	canDash = false
	boostTimer.start()


func add_ghost():
	ghost = ghost_node.instantiate()
	ghost.set_property(player.global_position, sprite.scale)
	get_tree().current_scene.add_child(ghost)


func _on_boost_timer_timeout():
	sprite.modulate.a = 1.0
	player.max_speed = player.normal_speed
	canDash = true
	ghost_timer.stop()


func _on_ghost_timer_timeout():
	add_ghost()
