extends Node
class_name BarrierHurt


@export var hurtbox: Hurtbox

func _ready() -> void:
	hurtbox.hurt.connect(func(hitbox: Hitbox):
		hitbox.owner.queue_free()
)
