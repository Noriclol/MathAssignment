
extends Node2D
class_name Enemy

@export var player : CharacterBody2D
@onready var statemachine : StateMachine = $StateMachine
@onready var info_panel : VBoxContainer = $InfoPanel

@onready var object_sprite : Sprite2D = $Sprite2D

var forward: float = 0
var right: float = 0

var relative_position : Global.PlayerDirection


func _ready() -> void:
	statemachine.init(self as Enemy)
	info_panel.enemy = self


func _process(delta: float) -> void:
	_check_relative_position()
	_set_enum()
	
	statemachine.process_frame(delta)
	_set_sprite_color()


func _set_sprite_color() -> void:
	if statemachine.current_state is StatePositionNorth:
		object_sprite.modulate = Color.BLUE
	if statemachine.current_state is StatePositionEast:
		object_sprite.modulate = Color.RED
	if statemachine.current_state is StatePositionWest:
		object_sprite.modulate = Color.WEB_GREEN
	if statemachine.current_state is StatePositionSouth:
		object_sprite.modulate = Color.YELLOW

func _set_enum() -> void:
	# forward
	if absf(forward) > absf(right):
		if forward > 0:
			relative_position = Global.PlayerDirection.North
			return
		if forward == 0:
			pass
		if forward < 0:
			relative_position = Global.PlayerDirection.South
			return
			
	#right
	else:
		if right > 0:
			relative_position = Global.PlayerDirection.West
			
			return
		if right == 0:
			pass
		if right < 0:
			relative_position = Global.PlayerDirection.East
			return
	info_panel._update_info()

func _check_relative_position() -> void:
	var direction_to_player = (player.global_position - global_position).normalized()
	
	forward = direction_to_player.y
	right = direction_to_player.x





