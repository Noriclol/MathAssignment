extends CanvasLayer
class_name GameUI

@export var player : mouseControlledPlayer
@export var text: Label
@export var wintext:Label

func set_asteroid_count(count:int = 0) -> void:
	text.text =  "asteroids left: " + str(count)

func set_winning_text() -> void:
	wintext.visible = true

func _on_area_body_exited(body: Node2D) -> void:
	set_asteroid_count(player.area.asteroid_amount)

func _on_area_area_cleared_event() -> void:
	set_winning_text()

func _on_area_body_entered(body: Node2D) -> void:
	set_asteroid_count(player.area.asteroid_amount)
