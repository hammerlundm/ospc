extends Control

var mouse_on = preload("res://assets/mouse_on.png")
var mouse_off = preload("res://assets/mouse_off.png")

var inventory = []

func _ready():
	mouse_deactivate()
	var panel
	for i in range(10):
		panel = get_node("camera/inventory/Panel" + str(i))
		panel.connect("mouse_enter", self, "show_name", [i])
		panel.connect("mouse_exit", get_node("camera/textbox"), "set_opacity", [0])

func show_name(idx):
	if idx < inventory.size():
		get_node("camera/textbox").display(inventory[idx])

func add_item(item):
	var box = get_node("camera/inventory/Panel" + str(inventory.size()))
	inventory.append(item)
	var sprite = Sprite.new()
	sprite.set_texture(load("res://assets/" + item + ".png"))
	sprite.set_centered(false)
	box.add_child(sprite)

func mouse_activate():
	Input.set_custom_mouse_cursor(mouse_on)

func mouse_deactivate():
	Input.set_custom_mouse_cursor(mouse_off)
