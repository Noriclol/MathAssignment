extends VBoxContainer

@onready var area_text : Label = $Label
@onready var primary : Label = $Label2
@onready var secondary : Label = $Label3

@export var player : Player

func _update_info() -> void:
	if player.area:
		area_text.text = player.area.area_name
