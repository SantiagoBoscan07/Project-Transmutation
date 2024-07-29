extends Node2D

@export_category("Timer")
@export var spawnTime: float
@export var spawnerDuration: float
@export_category("Object")
@export var objectToSpawn: PackedScene
@export_category("Location to Spawn")
@export var spawnUp: bool
@export var spawnLeft: bool
@export var spawnRight: bool
@export var spawnPosition: Vector2
@export_category("Mode")
@export var isShadow: bool
@export_category("Projectile Spawner Properties")
@export_range(0,2*PI) var alpha: float = 0.0
@export var projectileSpawnTime: float = 0.0
@export var spawnerTimer: float = 0.0
@export_category("Wave Manager")
@export var nextWave: Node2D
@onready var spawnTimer = $SpawnTime
@onready var spawnerDurationTimer = $SpawnerDuration
@onready var spawnerNode: SpawnerNode = $SpawnerNode as SpawnerNode


func _ready():
	spawnTimer.wait_time = spawnTime
	spawnerDurationTimer.wait_time = spawnerDuration
	spawnerDurationTimer.start()
	spawnTimer.start()


func handle_spawn(object: PackedScene):
	spawnerNode.scene = object
	if spawnUp:
		spawnerNode.spawn(0, isShadow, alpha,projectileSpawnTime, spawnerTimer, Vector2(randf_range(38,260),-16))
	elif spawnLeft:
		spawnerNode.spawn(1, isShadow, alpha,projectileSpawnTime, spawnerTimer, Vector2(-16,randf_range(40,100)))
	elif spawnRight:
		spawnerNode.spawn(2, isShadow, alpha,projectileSpawnTime, spawnerTimer, Vector2(312,randf_range(40,100)))
	else:
		spawnerNode.spawn(0, isShadow, alpha,projectileSpawnTime, spawnerTimer, spawnPosition)



func _on_spawn_time_timeout():
	handle_spawn(objectToSpawn)


func _on_spawner_duration_timeout():
	spawnTimer.stop()
	if nextWave:
		nextWave.process_mode = 0
