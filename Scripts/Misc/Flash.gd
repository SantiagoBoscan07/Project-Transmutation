extends Node
class_name Flash



@export var flash: AnimationPlayer


func _flash():
	flash.play("flash")
