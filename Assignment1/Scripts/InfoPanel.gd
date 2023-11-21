extends Node

@onready var relative_pos : Label = $Label

@onready var enemy : Enemy


func _update_info() -> void:
	if enemy != null:
		relative_pos.text = "I am " + _enum_to_string(enemy.relative_position) + " of player."


func _enum_to_string(pos:Global.PlayerDirection) -> String:
	match pos:
		Global.PlayerDirection.North:
			return "North"
		Global.PlayerDirection.South:
			return "South"
		Global.PlayerDirection.West:
			return "West"
		Global.PlayerDirection.East:
			return "East"
	return "null"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_update_info()
	pass
