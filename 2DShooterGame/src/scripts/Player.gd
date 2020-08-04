extends KinematicBody2D

export var speed: Vector2
var velocity: Vector2 = Vector2(0, 0)


func _ready() -> void:
	print("ready")
	

func _physics_process(delta: float) -> void:
	velocity = calculate_velocity(speed) * delta
	velocity = move_and_slide(velocity, Vector2.ZERO)


func calculate_velocity(spd) -> Vector2:
	var return_velocity: Vector2 = velocity
	
	return_velocity.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	return_velocity.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	return_velocity *= spd
	
	return return_velocity
