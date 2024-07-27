extends Node2D
class_name Idle
@export var sprite: Sprite2D
@export var speed: float = 0.5
var upTween
var downTween

func _ready():
	up()



func up():
	upTween = get_tree().create_tween()
	upTween.tween_property(sprite, "position",  Vector2(0,2),speed)
	upTween.connect("finished", oUpTweenFinished)

func oUpTweenFinished():
	down()

func down():
	downTween = get_tree().create_tween()
	downTween.tween_property(sprite, "position",  Vector2(0,-2),speed)
	downTween.connect("finished", onDownTweenFinished)

func onDownTweenFinished():
	up()
