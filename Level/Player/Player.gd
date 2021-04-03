extends KinematicBody2D
 

var speed = 100
var velocity = Vector2.ZERO
var last_velocity = velocity
var acceleration = Vector2.ZERO
var last_acceleration = acceleration
var d_acc = acceleration - last_acceleration
var friction = 0.9
var angle
var rotation_speed = 1.8

	
func get_input():
#	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
		acceleration.x -= 2
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
		acceleration.x += 2
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
		acceleration.y -= 2
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
		acceleration.y += 2
	

func _physics_process(delta):
	get_input()
	
	# Trying to make decent acceleration
	if acceleration.x - last_acceleration.x == 0:
		acceleration *= 0.99
#	if acceleration.x > -1 and acceleration.x < 1:
#		acceleration.x = 0

	if acceleration.y - last_acceleration.y == 0:
		acceleration *= 0.99
#	if acceleration.y > -1 and acceleration.y < 1:
#		acceleration.y = 0


#	if velocity == Vector2.ZERO:
#		acceleration = 1	
#	elif velocity == last_velocity:
#		print("Gotcha")
#		acceleration *= 1.01
#	elif velocity == last_velocity * -1:
#		acceleration = 1
#	else:
#		acceleration /= 1.01
		
#	acceleration *= friction
	print(acceleration)
	
	move_and_slide(velocity.normalized() * speed + acceleration)
	look_at(velocity)
	
	last_velocity = velocity
	last_acceleration = acceleration
