extends Node2D

@export var enemyProjectilePreload: PackedScene
@export_range(0,2*PI) var alpha: float = 0.0
@export var spawnTimer: Timer
@export var spawnTime: float = 0.0:
	set(value):
		spawnTime = value
		spawnTimer.wait_time = spawnTime
var theta: float = 0.0
var enemyProjectile
@export var isShadow: bool = false:
	set(value):
		isShadow = value
@export var canShoot: bool = true:
	set(value):
		canShoot = value

func getVector(angle):
	theta = angle + alpha
	return Vector2(cos(theta), sin(theta))

func shoot(angle):
	enemyProjectile = enemyProjectilePreload.instantiate()
	enemyProjectile.isShadow = isShadow
	enemyProjectile.position = global_position
	enemyProjectile.direction = getVector(angle)
	get_tree().current_scene.call_deferred("add_child", enemyProjectile)


func _on_spawn_timer_timeout():
	if canShoot:
		shoot(theta)
