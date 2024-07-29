extends Node

@export var health: Node

func _ready():
	Signals.heal.connect(func(amount: int):
		health.health += amount
)
