extends CharacterBody2D
class_name item

signal itemTypeSig()

enum itemTypes
{
	FIRE_ITEM,
	WATER_ITEM,
	EARTH_ITEM,
	AIR_ITEM
}

@export var currentItemType: itemTypes = itemTypes.FIRE_ITEM:
	set(value):
		currentItemType = value



func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
