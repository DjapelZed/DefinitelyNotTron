extends Node


func _physics_process(delta):
	$LightPath.add_point($Player/PathSpawn.global_position)
