extends CSGBox3D

#The Blue Cube 

var range = RandomNumberGenerator.new()
var start_x = range.randf_range(-2.0, 2.0)
var start_y = range.randf_range(0.5, 1.5)
var start_z = range.randf_range(-14.5, -15.5)

var start_position = Vector3(start_x, start_y, start_z)
var move_direction = Vector3(0, 0, 1)  
var move_speed = 3

func _ready() -> void:
	position = start_position

func _process(delta):
	position += move_direction * move_speed * delta
	
	if position.z > 0:
		queue_free()  
