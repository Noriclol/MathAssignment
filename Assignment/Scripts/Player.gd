extends CharacterBody2D
class_name Player


@onready var sprite : Sprite2D = $Sprite2D
@onready var collider : CollisionShape2D = $CollisionShape2D
@onready var info_panel : VBoxContainer = $InfoPanel

@export var speed: int = 55
var area: Area

func _ready() -> void:
	info_panel.player = self

func _handle_input() -> void:
	var move_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = move_direction * speed

func _physics_process(_delta: float) -> void:
	_handle_input()
	move_and_slide()

#	Colliders
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		print("Collided with: ", collision.get_collider().name)
		#collision.get_collider().free()

