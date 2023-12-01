extends Area2D
class_name Area

@export var area_name : String = "new area"
@onready var collider : CollisionShape2D = $CollisionShape2D


signal area_cleared_event


var asteroid_amount : int = 0

var area_cleared : bool = false

var random = Color.from_hsv(randf(),randf_range(0.5,1),randf_range(0.5,0.9), 0.3)

#detection of player and asteroids
func _on_body_entered(body: Node2D) -> void:
	if body is mouseControlledPlayer:
		print("player entered")
		body.area = self
	if body is Enemy:
		print("asteroid entered")
		asteroid_amount = asteroid_amount + 1

func _on_body_exited(body: Node2D) -> void:
	if body is mouseControlledPlayer:
		print("player exited")
	if body is Enemy:
		print("asteroid exited")
		asteroid_amount = asteroid_amount - 1
		print("asteroids left: ")
		if asteroid_amount <= 0:
			area_cleared = true
			print("area cleared: mission successful")
			area_cleared_event.emit()

func _process(delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	if collider.shape is CircleShape2D:
		var radius = collider.shape.radius
		draw_circle(Vector2.ZERO, radius , random)
