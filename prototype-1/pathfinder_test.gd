extends CharacterBody2D

var speed = 75.0
var rotation_speed = 3.0

@onready var nav_agent = $NavigationAgent2D
@onready var tilemap_layer: TileMapLayer

# Temp hard coding for testing
func set_tilemap_layer(tile: TileMapLayer):
	tilemap_layer = tile

func get_target(target_pos):
	nav_agent.target_position = target_pos

# Navigation stuff
func _physics_process(delta: float) -> void:
	if nav_agent.is_navigation_finished():
		return
	
	var current_pos = global_position
	var next_path_pos = nav_agent.get_next_path_position()
	
	var next_path_dir = current_pos.angle_to_point(next_path_pos)
	rotation = lerp_angle(rotation, next_path_dir, delta * rotation_speed)
	
	velocity = current_pos.direction_to(next_path_pos) * speed
	move_and_slide()
