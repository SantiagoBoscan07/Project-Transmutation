extends Node2D
class_name Idle
@export var sprite: Sprite2D
var up_tween
var down_tween

func _ready():
	up()



func up():
	up_tween = get_tree().create_tween()
	up_tween.tween_property(sprite, "position",  Vector2(0,2),0.5)
	up_tween.connect("finished", on_up_tween_finished)

func on_up_tween_finished():
	down()

func down():
	down_tween = get_tree().create_tween()
	down_tween.tween_property(sprite, "position",  Vector2(0,-2),0.5)
	down_tween.connect("finished", on_down_tween_finished)

func on_down_tween_finished():
	up()
