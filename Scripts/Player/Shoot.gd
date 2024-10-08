extends Node2D
class_name playerShootComponent
@export var player: CharacterBody2D
@export var shootPoint: Marker2D
@export var shootPoint2: Marker2D
@export var shootPoint3: Marker2D
@export var shootTimer: Timer
@export var multipleShootTimer: Timer
@onready var projectilePreload: PackedScene = preload("res://Scenes/Player/PlayerProjectile.tscn")
@onready var shootSound = $"../../Sounds/Shoot"

var canShoot: bool = true
var multipleShoot: bool = false
var projectile

func _ready():
	Signals.laser.connect(activateLaser)


func _physics_process(delta):
	if Input.is_action_pressed("shoot") and canShoot and !Globals.isPaused:
		shoot()

func activateLaser():
	multipleShoot = true
	multipleShootTimer.start()

func shoot():
	shootTimer.start()
	shootSound.play_with_variance()
	projectile = projectilePreload.instantiate()
	projectile.position = shootPoint.global_position
	get_tree().current_scene.add_child(projectile)
	if multipleShoot:
		projectile = projectilePreload.instantiate()
		projectile.position = shootPoint2.global_position
		get_tree().current_scene.add_child(projectile)
		projectile = projectilePreload.instantiate()
		projectile.position = shootPoint3.global_position
		get_tree().current_scene.add_child(projectile)
	canShoot = false


func _on_shoot_timer_timeout():
	canShoot = true


func _on_multiple_shoot_timeout():
	multipleShoot = false
