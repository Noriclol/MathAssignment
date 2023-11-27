extends Area2D
class_name Area

@export var area_name : String = "new area"
@onready var collider : CollisionShape2D = $CollisionShape2D

var random = Color.from_hsv(randf(),randf_range(0.5,1),randf_range(0.5,0.9), 0.3)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.area = self
		body.info_panel._update_info()
		print(body.area.area_name)

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		if body.area == self:
			body.area = null

func _process(delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	if collider.shape is CircleShape2D:
		var radius = collider.shape.radius
		draw_circle(Vector2.ZERO, radius , random)
