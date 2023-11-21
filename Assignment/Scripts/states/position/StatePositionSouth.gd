class_name StatePositionSouth
extends State

@export var state_position_north : StatePositionNorth
@export var state_position_west : StatePositionWest
@export var state_position_east : StatePositionEast

func _ready() -> void:
	pass

func enter() -> void:
	super()
	on_entered.emit()

func exit() -> void:
	super()

func process_frame(_delta:float) -> State:
	match parent.relative_position_primary:
		Global.PlayerDirection.North:
			return state_position_north
		Global.PlayerDirection.South:
			return self
		Global.PlayerDirection.West:
			return state_position_west
		Global.PlayerDirection.East:
			return state_position_east
	return self
	
func process_physics(_delta:float) -> State:
	return null
