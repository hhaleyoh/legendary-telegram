extends Node2D
class_name GameManager

# Currently hardcoded to create a single ship and allow for moving it around by clicking.

const ship_scene = preload("res://pathfinder_test.tscn")

@onready var hex_map: HexMap = $HexMap
@onready var ship_manager: ShipManager = $ShipManager

var selected: ship_class

# Hard coded to create a ship for testing
func _ready() -> void:
	ship_manager.set_tilemap(hex_map)
	
	var my_ship = ship_scene.instantiate()
	my_ship.team = 1
	selected = my_ship
	ship_manager.setup_ship(my_ship)

# Hard coded controls for moving ship
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			var global_pos = get_global_mouse_position()
			var grid_pos = hex_map.get_tile_coordinates(global_pos)
			var map_pos = hex_map.get_pathing_pos(grid_pos)
			print(grid_pos)
			selected.set_target(map_pos)

# uncomment to get output of ship's tile position
#func _physics_process(delta: float) -> void:
	#print(ship_manager.get_ship_tile_pos(selected))
