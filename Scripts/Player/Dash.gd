extends Node2D
class_name dashPlayerComponent
@export var player: CharacterBody2D
@export var dashTimer: Timer
@export var dashCooldown: Timer
@export var ghost_node: PackedScene
@export var lightSprite: Sprite2D
@export var shadowSprite: Sprite2D
@export var ghost_timer: Timer
@export var hurtboxLight: Area2D
@export var hurtboxShadow: Area2D
@onready var dashSound = $"../../Sounds/Dash"
var canDash: bool = true
var boostSpeed
var ghost


func _physics_process(delta):
	if Input.is_action_pressed("dash") and canDash:
		boost()


func boost():
	dashSound.play_with_variance()
	hurtboxLight.is_invicible = true
	hurtboxShadow.is_invicible = true
	if ModeManager.current_mode == 0:
		lightSprite.modulate.a = 150.0 / 250.0
	elif ModeManager.current_mode == 1:
		shadowSprite.modulate.a = 150.0 / 250.0
	ghost_timer.start()
	boostSpeed = player.max_speed * 2
	player.max_speed = boostSpeed
	canDash = false
	Signals.emit_signal("dashBar", dashTimer.wait_time)
	dashTimer.start()


func add_ghost():
	if ModeManager.current_mode == 0:
		ghost = ghost_node.instantiate()
		ghost.set_property(player.global_position, lightSprite.scale)
		get_tree().current_scene.add_child(ghost)
	elif ModeManager.current_mode == 1:
		ghost = ghost_node.instantiate()
		ghost.set_property(player.global_position, shadowSprite.scale)
		get_tree().current_scene.add_child(ghost)


func _on_ghost_timer_timeout():
	add_ghost()


func _on_dash_timer_timeout():
	if ModeManager.current_mode == 0:
		ModeManager.mode_switch.emit(0)
	elif ModeManager.current_mode == 1:
		ModeManager.mode_switch.emit(1)
	lightSprite.modulate.a = 1.0
	shadowSprite.modulate.a = 1.0
	player.max_speed = player.normal_speed
	ghost_timer.stop()
	Signals.emit_signal("dashCooldownBar", dashCooldown.wait_time)
	dashCooldown.start()


func _on_dash_cooldown_timeout():
	canDash = true
