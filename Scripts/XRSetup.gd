extends Node3D

var xr_interface: XRInterface

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")



	# Handle OpenXR pose recentered signal
func _on_right_controller_button_pressed(name):
	if name == "primary_click":
		XRServer.center_on_hmd(XRServer.RESET_BUT_KEEP_TILT, true)
