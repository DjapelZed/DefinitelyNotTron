extends KinematicBody2D
 

var speed = 100
var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var angle
var rotation_speed = 1.8

func get_input():
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
	

func _physics_process(delta):
	var LightPath = get_node("../Path")
	get_input() # Controls of the player

	var global_spawn_y = $CollisionShape2D.shape.extents.y + position.y + 1
	# height + global player position
	var global_spawn_x = $CollisionShape2D.shape.extents.x/2 + position.x

	LightPath.add_point(Vector2(global_spawn_x, global_spawn_y)) # Drawing a point of path
	move_and_slide(velocity * speed) # Moves the player
	print($CollisionShape2D.shape.extents.x)
	
