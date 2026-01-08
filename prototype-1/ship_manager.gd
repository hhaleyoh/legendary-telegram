extends Node2D
class_name ShipManager

# Not currently doing anything. Will be useful once multiple ships are present

var ship_dict = {}
var tilemap: HexMap

func set_tilemap(tiles: HexMap):
	tilemap = tiles

func setup_ship(ship: ship_class):
	add_child(ship)

func get_ship_tile_pos(ship: ship_class):
	return tilemap.get_tile_coordinates(ship.get_pos())
