extends Node2D
class_name SpawnerNode

@export var scene: PackedScene
@onready var projectileSpawnerDuration = $"../ProjectileSpawnerDuration"
var instance

func spawn(position: int, isShadow: bool,alpha: float,spawnTime: float, projectileSpawnerTime: float, global_spawn_position: Vector2 = global_position, parent: Node2D = get_tree().current_scene) -> Node:
	assert(scene is PackedScene, "Error: The scene export was never set")
	instance = scene.instantiate()
	if instance.is_in_group("Enemy"):
		match position:
			0:
				instance.upEntrance = true
			1:
				instance.leftEntrance = true
			2:
				instance.rightEntrance = true
		if isShadow:
			instance.isShadow = true
	if instance.is_in_group("Item"):
		instance.currentItemType = randi_range(0,3)
	if instance.is_in_group("ProjectileSpawner"):
		instance.alpha = alpha
		instance.spawnTime = spawnTime
		instance.isShadow = isShadow
		projectileSpawnerDuration.wait_time = projectileSpawnerTime
		projectileSpawnerDuration.start()
	parent.add_child(instance)
	instance.global_position = global_spawn_position
	return instance


func _on_projectile_spawner_duration_timeout():
	instance.queue_free()
