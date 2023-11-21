class_name StateMachine
extends Node

@export var start_state : State
var current_state : State

func init(parent: Node) -> void:
	for child in get_children():
		child.parent = parent
	change_state(start_state)

func change_state(newState: State) -> void:
	if newState == current_state:
		return
	if current_state:
		current_state.exit()
	current_state = newState
	
	print(get_parent().name + "'s state changed to: ", current_state)	
	if current_state:
		current_state.enter()

func process_frame(delta:float)->void:
	var newState = current_state.process_frame(delta)
	if newState :
		change_state(newState);

func process_physics(delta:float)->void:
	var newState = current_state.process_physics(delta)
	if newState :
		change_state(newState);

func process_input(event: InputEvent)->void:
	var newState = current_state.process_input(event)
	if newState:
		change_state(newState);
