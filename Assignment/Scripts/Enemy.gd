extends Node2D
class_name Enemy

@export var player : RigidBody2D
@onready var statemachine_position : StateMachine = $StateMachine_Position
@onready var info_panel : VBoxContainer = $InfoPanel
@onready var object_sprite : Sprite2D = $Sprite2D
@onready var collider: CollisionShape2D = $CollisionShape2D

var forward: float = 0
var right: float = 0

var relative_position_primary   : Global.PlayerDirection
var relative_position_secondary : Global.PlayerDirection

var color_north : Color = Color.BLUE
var color_south : Color = Color.YELLOW
var color_west  : Color = Color.GREEN
var color_east  : Color = Color.RED

func _ready() -> void:
	statemachine_position.init(self as Enemy)

func _process(delta: float) -> void:
	_check_relative_position()
	_set_primary()
	_set_secondary()
	statemachine_position.process_frame(delta)
	_set_sprite_color_adv()

func _fetch_color(pos:Global.PlayerDirection) -> Color:
	match pos:
		Global.PlayerDirection.North:
			return color_north
		Global.PlayerDirection.South:
			return color_south
		Global.PlayerDirection.West:
			return color_west
		Global.PlayerDirection.East:
			return color_east
	return Color.ALICE_BLUE


func _set_sprite_color_adv() -> void:
	var _strength_primary = _get_strength(relative_position_primary)
	var strength_secondary = _get_strength(relative_position_secondary)
	
	var finalColor = _fetch_color(relative_position_primary).lerp(_fetch_color(relative_position_secondary),clampf(strength_secondary, 0.0, 0.5))
	object_sprite.modulate = finalColor

func _round_to_decimal(val:float) -> float:
	var stepsize = 0.01
	return roundf(val / stepsize) * stepsize

func _get_strength(pos:Global.PlayerDirection) -> float:
	match pos:
		Global.PlayerDirection.North:
			return  _round_to_decimal(forward)
		Global.PlayerDirection.South:
			return -_round_to_decimal(forward)
		Global.PlayerDirection.West:
			return  _round_to_decimal(right)
		Global.PlayerDirection.East:
			return -_round_to_decimal(right)
	return 0

func _check_relative_position() -> void:
	var direction_to_player = (player.global_position - global_position).normalized()
	forward = direction_to_player.y
	right = direction_to_player.x

func _set_primary() -> void:
	if absf(forward) > absf(right):
		if forward > 0:
			relative_position_primary = Global.PlayerDirection.North
			return
		if forward < 0:
			relative_position_primary = Global.PlayerDirection.South
			return
	else:
		if right > 0:
			relative_position_primary = Global.PlayerDirection.West
			return
		if right < 0:
			relative_position_primary = Global.PlayerDirection.East
			return
	return

func _set_secondary() -> void:
	if relative_position_primary == Global.PlayerDirection.North or  relative_position_primary == Global.PlayerDirection.South:
		if right > 0:
			relative_position_secondary = Global.PlayerDirection.West
			return
		if right < 0:
			relative_position_secondary = Global.PlayerDirection.East
			return
	elif relative_position_primary == Global.PlayerDirection.West or  relative_position_primary == Global.PlayerDirection.East:
		if forward > 0:
			relative_position_secondary = Global.PlayerDirection.North
			return
		if forward < 0:
			relative_position_secondary = Global.PlayerDirection.South
			return
