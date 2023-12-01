extends RigidBody2D
class_name mouseControlledPlayer
#second iteration of player simplified for project purpouses.

var hit_force : float = 30.0

@export var area: Area
@export var gameUI: GameUI


func _ready() -> void:
	#set to startvalue as the asteroidcount is 0 at this time
	gameUI.set_asteroid_count(129)

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var dir = global_position.direction_to(get_global_mouse_position())
		apply_impulse(dir * hit_force)

