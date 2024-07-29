extends Node
class_name BarrierHurt


@export var hurtbox: Hurtbox

func _ready() -> void:
	hurtbox.hurt.connect(func(hitbox: Hitbox):
		if !hitbox.owner.is_in_group("Enemy"):
			hitbox.owner.queue_free()
)
