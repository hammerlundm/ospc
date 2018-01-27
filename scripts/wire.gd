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
		print("You won!")