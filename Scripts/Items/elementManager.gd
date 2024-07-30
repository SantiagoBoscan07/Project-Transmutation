extends Node

var itemSlots: Array 
var sum = 0
@export var frame1: Node2D
@export var frame2: Node2D
@export var frame3: Node2D
@onready var transmuteSound = $"../../Sounds/Transmute"
@onready var disposeSound = $"../../Sounds/Dispose"


func _ready():
	itemSlots.resize(2)
	Signals.itemCollected.connect(itemCollect)


func itemCollect(itemType):
	for i in range(itemSlots.size()):
		if itemSlots[i] == null:
			itemSlots[i] = itemType
			updatePortray(i, itemSlots[i])
			if itemSlots[0] != null and itemSlots[1] != null:
				for j in itemSlots:
					sum += j
				sum += 1
				addResultant(sum)
			break


func updatePortray(index, itemType):
	if index == 0:
		addPortray(itemType, frame1)
	elif index == 1:
		addPortray(itemType, frame2)


func addPortray(itemType,frame):
	match itemType:
		0:
			frame.find_child("Fire").show()
		1:
			frame.find_child("Water").show()
		2:
			frame.find_child("Earth").show()
		3:
			frame.find_child("Air").show()

func hidePortray(itemType,frame):
	match itemType:
		0:
			frame.find_child("Fire").hide()
		1:
			frame.find_child("Water").hide()
		2:
			frame.find_child("Earth").hide()
		3:
			frame.find_child("Air").hide()

func addResultant(result):
	match result:
		2:
			frame3.find_child("Barrier").show()
		6:
			frame3.find_child("Laser").show()
		_:
			frame3.find_child("Heal").show()

func removeResultant(result):
	match result:
		2:
			frame3.find_child("Barrier").hide()
		6:
			frame3.find_child("Laser").hide()
		_:
			frame3.find_child("Heal").hide()
	sum = 0


func _unhandled_input(event):
	if event.is_action_pressed("transmute") and !Globals.isPaused:
		if sum != 0:
			hidePortray(itemSlots[0], frame1)
			itemSlots[0] = null
			hidePortray(itemSlots[1], frame2)
			itemSlots[1] = null
			transmuteSound.play_with_variance()
			match sum:
				2:
					Signals.barrier.emit()
				6:
					Signals.laser.emit()
				_:
					Signals.heal.emit(10)
			removeResultant(sum)
	if event.is_action_pressed("dispose_first") and !Globals.isPaused:
		if itemSlots[0] != null:
			hidePortray(itemSlots[0], frame1)
			itemSlots[0] = null
			disposeSound.play_with_variance()
			if sum != 0:
				removeResultant(sum)
	if event.is_action_pressed("dispose_second") and !Globals.isPaused:
		if itemSlots[1] != null:
			hidePortray(itemSlots[1], frame2)
			itemSlots[1] = null
			disposeSound.play_with_variance()
			if sum != 0:
				removeResultant(sum)
