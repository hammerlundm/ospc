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
	var space_scene = space.instance()
	get_parent().get_parent().add_child(space_scene)
	queue_free()

func _on_to_living_button_up():
	var living_scene = living.instance()
	get_parent().get_parent().add_child(living_scene)
	queue_free()

func _on_to_control_button_up():
	var control_scene = control.instance()
	get_parent().get_parent().add_child(control_scene)
	queue_free()
