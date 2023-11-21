class_name StateVisibilityObscured
extends State

func _ready() -> void:
	pass

func enter() -> void:
	on_entered.emit()
	pass

func exit() -> void:
	pass

func process_frame(_delta:float) -> State:
	return null

func process_physics(_delta:float) -> State:
	return null
