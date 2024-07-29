extends Node2D

@export var barrierTimer: Timer
@export var barrierBlink: Timer
@export var barrierHurtbox: Hurtbox
@export var blinkAnimation: AnimationPlayer
@export var sprite: Sprite2D

func _ready():
	barrierHurtbox.is_invicible = true
	Signals.barrier.connect(activateBarrier)

func activateBarrier():
	barrierTimer.start()
	barrierBlink.start()
	barrierHurtbox.is_invicible = false
	sprite.show()


func _on_barrier_timeout():
	sprite.hide()
	blinkAnimation.stop()
	barrierHurtbox.is_invicible = true


func _on_barrier_blink_timeout():
	blinkAnimation.play("blink")
