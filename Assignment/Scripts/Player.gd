extends CharacterBody2D


@onready var sprite : Sprite2D = $Sprite2D
@onready var collider : CollisionShape2D = $CollisionShape2D

@export var speed: int = 55

func _handle_input() -> void:
	var move_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = move_direction * speed

func _physics_process(_delta: float) -> void:
	_handle_input()
	move_and_slide()
