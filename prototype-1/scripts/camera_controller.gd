extends Camera2D

var direction: Vector2
var speed: float = 10.0

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	if direction != Vector2.ZERO:
		offset = offset + direction*speed
