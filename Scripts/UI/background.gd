extends ParallaxLayer

@export var speed = -15

func _process(delta):
	motion_offset.y += speed * delta
