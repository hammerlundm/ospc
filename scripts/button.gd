extends TextureButton

export(bool) var HOVER

func _ready():
	if HOVER:
		activate()

func activate():
	connect("mouse_enter", get_node("../../.."), "mouse_activate")
	connect("mouse_exit", get_node("../../.."), "mouse_deactivate")

func deactivate():
	disconnect("mouse_enter", get_node("../../.."), "mouse_activate")
	disconnect("mouse_exit", get_node("../../.."), "mouse_deactivate")
