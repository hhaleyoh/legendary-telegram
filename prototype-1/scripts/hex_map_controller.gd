extends TileMapLayer
class_name HexMap

func get_tile_coordinates(pos):
	return local_to_map(to_local(pos))

func get_pathing_pos(tile_coordinates):
	return map_to_local(tile_coordinates)

# hex map tutorial https://www.youtube.com/watch?v=1qmXFIJU1QE
