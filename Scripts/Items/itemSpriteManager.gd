extends Node2D

@export var fireSprite: Sprite2D
@export var waterSprite: Sprite2D
@export var earthSprite: Sprite2D
@export var airSprite: Sprite2D

func _ready():
	if owner.currentItemType == 0:
		fireSprite.show()
	elif owner.currentItemType == 1:
		waterSprite.show()
	elif owner.currentItemType == 2:
		earthSprite.show()
	elif owner.currentItemType == 3:
		airSprite.show()


