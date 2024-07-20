extends Node2D

@export var enemyProjectilePreload: PackedScene
@export_range(0,2*PI) var alpha: float = 0.0
@export var spawnTime: float = 1.0
@export var spawnTimer: Timer
var theta: float = 0.0
var enemyProjectile

func _ready():
	spawnTimer.wait_time = spawnTime
	$Sprite2D.hide()

func getVector(angle):
	theta = angle + alpha
	return Vector2(cos(theta), sin(theta))

func shoot(angle):
	enemyProjectile = enemyProjectilePreload.instantiate()
	
	enemyProjectile.position = global_position
	enemyProjectile.direction = getVector(angle)
	get_tree().current_scene.call_deferred("add_child", enemyProjectile)


func _on_spawn_timer_timeout():
	shoot(theta)
