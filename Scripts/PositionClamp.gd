extends Node
@export var body: CharacterBody2D
@export var margin: = 100

var left_border = 0
var right_border = 1920
var bottom_border = 1728
var up_border = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	body.global_position.x = clamp(body.global_position.x, left_border + margin, right_border - margin)
	body.global_position.y = clamp(body.global_position.y, up_border + margin, bottom_border - margin)
