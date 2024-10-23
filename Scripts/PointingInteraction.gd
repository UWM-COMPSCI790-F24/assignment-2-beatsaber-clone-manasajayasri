extends XRController3D

var active_collider = null
var isExtended = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var start = global_position + (-global_basis.z * 0.1)
	var end = (-global_basis.z * 1.0) + start
	
	$"LineRenderer".points[0] = start
	$"LineRenderer".points[1] = end

	$"RayCast3D".target_position = $"RayCast3D".to_local(end)
	
	if $RayCast3D.is_colliding():
		var cur_collider = $RayCast3D.get_collider()
		if active_collider == null or active_collider != cur_collider:
			active_collider = cur_collider
			if cur_collider.name == "CubeArea":
				active_collider.get_parent().queue_free() 
				#print("Cube Destroyed: ", active_collider.get_parent().name)
				$"Boing".play()
	elif active_collider != null:
		active_collider = null

func _on_button_pressed(name: String) -> void:
	if name == "ax_button":
		isExtended = !isExtended
		$LineRenderer.visible = isExtended
		$RayCast3D.enabled = isExtended
