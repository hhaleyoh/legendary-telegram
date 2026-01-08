extends CharacterBody2D
class_name ship_class

# Test scene for ship movement and navigation.

@export var team: int

var speed = 75.0
var speed_mult = 2.0
var rotation_speed = 3.0

@onready var nav_agent = $NavigationAgent2D

func set_target(target_pos):
	nav_agent.target_position = target_pos

func get_pos():
	return position

# Navigation stuff
func _physics_process(delta: float) -> void:
	if nav_agent.is_navigation_finished():
		return
	
	var current_pos = global_position
	var next_path_pos = nav_agent.get_next_path_position()
	
	var prev_rotation = rotation
	var next_path_dir = current_pos.angle_to_point(next_path_pos)
	rotation = lerp_angle(rotation, next_path_dir, delta * rotation_speed)
	
	if abs(prev_rotation - rotation) < 0.01:
		velocity = current_pos.direction_to(next_path_pos) * (speed * speed_mult)
	else:
		velocity = current_pos.direction_to(next_path_pos) * speed
	move_and_slide()
	
