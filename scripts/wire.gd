extends Node2D

var inside = false
var wire

func _ready():
	var area = get_node("Area2D")
	area.connect("body_enter", self, "set_inside", [true])
	area.connect("body_exit", self, "set_inside", [false])
	wire = get_node("KinematicBody2D")
	set_process_input(true)

func set_inside(body, val):
	if body == wire:
		inside = val

func _input(event):
	if inside && event.type == InputEvent.MOUSE_BUTTON && event.pressed:
		queue_free()
		get_node("../..").add_item("wire")
		get_node("../../camera/textbox").display("I got a wire")
		get_node("../foreground/wire").queue_free()
		get_node("../..").selected = null
		get_node("../..").mouse_deactivate()