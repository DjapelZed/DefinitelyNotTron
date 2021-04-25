extends Line2D



func is_colliding(_Node):
	var width = _Node.shape.extents.x 
	var height = _Node.shape.extents.y 
	var _position =  _Node.global_position
	
	var n = 0
	for point in range(get_point_count()):
		n += 1
		if n % 2 == 0:
			n = 0
			var point_position = get_point_position(point) # TODO: Optimize
			if (_position.x + width) >= point_position.x and \
				(_position.x - width) >= point_position.x and \
				(_position.y + height) >= point_position.y and \
				(_position.y - height) >= point_position.y:
					return true
			return false
			
			
	
