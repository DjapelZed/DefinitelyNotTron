extends KinematicBody2D
 

var speed = 100
var velocity = Vector2.ZERO
	
	
func get_input():
#	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity = Vector2(-1, 0)
		rotation_degrees = -90
	if Input.is_action_pressed("ui_right"):
		velocity = Vector2(1, 0)
		rotation_degrees = 90
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(0, -1)
		rotation_degrees = 0
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2(0, 1)
		rotation_degrees = 180
	

func _process(delta):
	get_input()
	
	move_and_slide(velocity * speed)
#	rotation = velocity.angle()
