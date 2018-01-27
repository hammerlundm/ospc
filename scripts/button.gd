extends TextureButton

export(bool) var HOVER

func _ready():
	if HOVER:
		connect("mouse_enter", get_node("../../.."), "mouse_activate")
		connect("mouse_exit", get_node("../../.."), "mouse_deactivate")
