extends TileMap

var noise := FastNoiseLite.new()
@export var tileset : TileSet


func _create_noise(x_pos, y_pos, width, height) -> void:
	noise.seed = randi()
	#print("generating tilemap")
	for x in range(width):
		for y in range(height):
			#print("tile| x: " + str(x) + " y: " + str(y))
			var pos = Vector2i(x+x_pos, y + y_pos)
			#print("pos: " , pos)
			var noise_value = noise.get_noise_2d(x + x_pos, y + y_pos)
			#print("noise: " , noise_value)
			var tile_id = _map_noise_to_tile_id(noise_value)
			#print("tile value" , tile_id)
			set_cell(0, pos,0, Vector2i(tile_id, 0))
			#get_cell_tile_data(0, pos)

func _map_noise_to_tile_id(noise_value: float) -> int:
	# Assuming noise value is in range -1 to 1 and you have 4 tiles
	# You'll need to adjust this mapping according to your specific tiles and noise range
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
	#print("tilecount: ",tileset.get_source(0).get_tiles_count())
	
	
	_create_noise(-50,-50, 100, 100)
	pass

func _process(delta: float) -> void:
	pass
#	# Add a tile if the left mouse button is pressed according to its global position
#	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
#		var tile : Vector2 = local_to_map(get_global_mouse_position())
#		set_cell(0, tile, 0, Vector2i.ZERO)
#
#
#	# Remove a tile if the right mouse button is pressed according to its global position
#	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT)):
#		var tile : Vector2 = local_to_map(get_global_mouse_position())
#		erase_cell(0, tile)
#
#	self.force_update(0)

