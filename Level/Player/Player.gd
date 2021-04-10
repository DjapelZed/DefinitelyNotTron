extends KinematicBody2D

# 1. Right/Left keys - rotate a bike
# 2. Up/Down - changes a velocity 


#var speed = 100
#var velocity = Vector2.ZERO
#
#
#func get_input():
#	velocity = Vector2.ZERO
#	if Input.is_action_pressed("ui_left"):
#		rotation_degrees -= 2
#	if Input.is_action_pressed("ui_right"):
#		rotation_degrees += 2
#	if Input.is_action_pressed("ui_up"):
#		speed += 10
#	if Input.is_action_pressed("ui_down"):
#		speed -= 10
#
#
#func _process(delta):
#	get_input()
#	velocity = Vector2(1*cos(rotation), -1*sin(rotation))
##	velocity = Vector2(speed,0).rotated(rotation_degrees)
##	The bike can only move forwards
#	if speed <= 0:
#		speed = 0
#
#
#
#	print("velocity: ", velocity, " rotation degrees: ", rotation_degrees, " rotation ", rotation)
#	move_and_slide(velocity * speed)



export (int) var speed = 200
export (float) var rotation_speed = 1.5 

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
	
	if speed < 100:
		speed = 100
		
	velocity = Vector2(speed, 0).rotated(rotation)
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
