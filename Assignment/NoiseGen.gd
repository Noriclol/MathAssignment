extends TileMap

var noise := FastNoiseLite.new()
@export var tileset : TileSet


func _create_noise(x_pos, y_pos, width, height) -> void:
	noise.seed = randi()
	for x in range(width):
		for y in range(height):
			var pos = Vector2i(x+x_pos, y + y_pos)
			var noise_value = noise.get_noise_2d(x + x_pos, y + y_pos)
			var tile_id = _map_noise_to_tile_id(noise_value)
			set_cell(0, pos,0, Vector2i(tile_id, 0))

#Fetch tile corresponding to tile.
func _map_noise_to_tile_id(noise_value: float) -> int:
	if noise_value < -0.5:
		return 0 # Tile ID for first tile
	elif noise_value < -0.1:
		return 1 # Tile ID for second tile
	elif noise_value < 0.2:
		return 2 # Tile ID for third tile
	elif noise_value < 0.5:
		return 3 # Tile ID for fourth tile
	else:
		return 3

func _ready() -> void:
	_create_noise(-200,-200, 400, 400)
	pass



