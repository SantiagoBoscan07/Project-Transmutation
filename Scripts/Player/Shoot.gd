extends Node2D
class_name playerShootComponent
@export var player: CharacterBody2D
@export var shootPoint: Marker2D
@export var shootTimer: Timer
@onready var projectilePreload: PackedScene = preload("res://Scenes/Player/PlayerProjectile.tscn")
var canShoot: bool = true
var projectile

func _physics_process(delta):
	if Input.is_action_pressed("shoot") and canShoot:
		shoot()


func shoot():
	shootTimer.start()
	projectile = projectilePreload.instantiate()
	projectile.position = shootPoint.global_position
	get_tree().current_scene.add_child(projectile)
	canShoot = false


func _on_shoot_timer_timeout():
	canShoot = true
