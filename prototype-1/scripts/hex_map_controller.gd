extends TileMapLayer

@export var char: CharacterBody2D

func _ready() -> void:
	char.set_tilemap_layer(self)

# Click a spot to print the tile coordinates
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			var global_click_pos = event.position
			var grid_pos = local_to_map(to_local(global_click_pos))
			print(grid_pos)
			
			# This gives the ship the target tile when you click
			char.get_target(map_to_local(grid_pos))

# hex map tutorial https://www.youtube.com/watch?v=1qmXFIJU1QE
