extends KinematicBody2D



export (int) var speed = 200
export (float) var rotation_speed = 1.5 

const BIKE_SIZE = Vector2(44, 100)
var velocity = Vector2()
var rotation_dir = 0


func get_input():
	rotation_dir = 0
#	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
		speed -= 5
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
		speed -= 5
	if Input.is_action_pressed("ui_down"):
		speed -= 10
	if Input.is_action_pressed("ui_up"):
		speed += 10

	

func _physics_process(delta):
	get_input()

	print($"../LightPath".is_colliding($CollisionShape2D))

	
	
	if speed < 100:
		speed = 100
	
	velocity = Vector2(speed, 0).rotated(rotation)
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
