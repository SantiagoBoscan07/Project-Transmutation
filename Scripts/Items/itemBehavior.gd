extends Node2D

@export var sprite: Sprite2D
@export var idle: Node2D
@export var hurtbox: Area2D
var fadeTween
var upTween

func _ready():
	hurtbox.area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	Signals.itemCollected.emit(owner.currentItemType)
	hurtbox.area_entered.disconnect(_on_area_entered)
	if idle.upTween:
		idle.upTween.stop()
	if idle.downTween:
		idle.downTween.stop()
	upTween = get_tree().create_tween()
	fadeTween = get_tree().create_tween()
	upTween.tween_property(sprite,"position", Vector2(0,-32),2.0)
	fadeTween.tween_property(sprite, "modulate", Color(255,255,255,0), 1.5)
	fadeTween.connect("finished", onFadeFinished)

func onFadeFinished():
	queue_free()
