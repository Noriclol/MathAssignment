class_name StatePositionEast
extends State

@export var state_position_north : StatePositionNorth
@export var state_position_south: StatePositionSouth
@export var state_position_west : StatePositionWest


func _ready() -> void:
	pass

func enter() -> void:
	super()
	on_entered.emit()

func exit() -> void:
	super()


func _eval_state() -> State:
	match parent.relative_position_primary:
		Global.PlayerDirection.North:
			return state_position_north
		Global.PlayerDirection.South:
			return state_position_south
		Global.PlayerDirection.West:
			return state_position_west
		Global.PlayerDirection.East:
			return self
	return self


func process_frame(_delta:float) -> State:
	return _eval_state()

func process_physics(_delta:float) -> State:
	return null
