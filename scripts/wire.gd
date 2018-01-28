extends Node2D

var inside = false
var wire

var scissor_open = preload("res://assets/scissor_top2.png")
var scissor_closed = preload("res://assets/scissor_top.png")

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
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.pressed:
			get_node("Area2D/top").set_texture(scissor_closed)
			if inside:
				queue_free()
				get_node("../..").remove_item("tool")
				get_node("../..").add_item("wire")
				get_node("../foreground/wire").queue_free()
		else:
			get_node("Area2D/top").set_texture(scissor_open)
