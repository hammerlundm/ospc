extends ParallaxLayer

var to_space = null
var space = preload("res://scenes/space.tscn")
var to_living = null
var living = preload("res://scenes/living_room.tscn")
var to_control = null
var control = preload("res://scenes/control_room.tscn")

func _ready():
	if has_node("to_space"):
		to_space = get_node("to_space")
		to_space.connect("button_up", self, "_on_to_space_button_up")
	if has_node("to_living"):
		to_living = get_node("to_living")
		to_living.connect("button_up", self, "_on_to_living_button_up")
	if has_node("to_control"):
		to_control = get_node("to_control")
		to_control.connect("button_up", self, "_on_to_control_button_up")

func _on_to_space_button_up():
	if get_node("../..").battery_location == "suit":
		get_parent().set_name("asdf")
		var space_scene = space.instance()
		space_scene.set_name("background")
		get_node("../..").add_child(space_scene)
		get_node("../..").mouse_deactivate()
		get_parent().queue_free()
		get_node("../../camera").set_limit(MARGIN_LEFT, 0)
		get_node("../../camera").set_limit(MARGIN_RIGHT, 1280)
	else:
		get_node("../../camera/textbox").display("My suit needs a battery!")

func _on_to_living_button_up():
	get_parent().set_name("asdf")
	var living_scene = living.instance()
	living_scene.set_name("background")
	get_node("../..").add_child(living_scene)
	get_node("../..").mouse_deactivate()
	get_parent().queue_free()
	get_node("../../camera").set_limit(MARGIN_LEFT, -1280)
	get_node("../../camera").set_limit(MARGIN_RIGHT, 1280)

func _on_to_control_button_up():
	get_parent().set_name("asdf")
	var control_scene = control.instance()
	control_scene.set_name("background")
	get_node("../..").add_child(control_scene)
	get_node("../..").mouse_deactivate()
	get_parent().queue_free()
	get_node("../../camera").set_limit(MARGIN_LEFT, 0)
	get_node("../../camera").set_limit(MARGIN_RIGHT, 1280)
