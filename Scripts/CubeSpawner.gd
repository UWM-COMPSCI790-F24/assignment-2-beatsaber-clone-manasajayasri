extends WorldEnvironment

var cube = preload("res://SceneInstances/cube.tscn")
var second_cube = preload("res://SceneInstances/second_cube.tscn")
var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = 1 #randf_range(0.5, 2.0)
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(_on_Timer_timeout)
	#print("Timer started with an interval of ", timer.wait_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_Timer_timeout():
	var red_cube = cube.instantiate()
	red_cube.set_script(load("res://Scripts/CubeMovement.gd"))
	red_cube.get_child(0).set_collision_layer_value(10, true)
	add_child(red_cube)
	
	var blue_cube = second_cube.instantiate()
	blue_cube.set_script(load("res://Scripts/CubeOnMove.gd"))
	blue_cube.get_child(0).set_collision_layer_value(9, true)
	add_child(blue_cube)
