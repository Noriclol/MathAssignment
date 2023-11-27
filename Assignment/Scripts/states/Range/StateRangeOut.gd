class_name StateRangeOut
extends State

@export var state_range_in : StateRangeIn

func _ready() -> void:
	pass

func enter() -> void:
	super()
	on_entered.emit()

func exit() -> void:
	super()




func process_frame(_delta:float) -> State:
	if parent.in_range():
		return state_range_in
	return self

func process_physics(_delta:float) -> State:
	return null
