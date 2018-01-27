extends Control

var mouse_on = preload("res://assets/mouse_on.png")
var mouse_off = preload("res://assets/mouse_off.png")

var inventory = []
var selected = null

var battery_location = "suit"

func _ready():
	set_process_unhandled_input(true)
	mouse_deactivate()
	var panel
	for i in range(10):
		panel = get_node("camera/inventory/Panel" + str(i))
		panel.connect("mouse_enter", self, "show_name", [i])
		panel.connect("mouse_exit", get_node("camera/textbox"), "set_opacity", [0])
		panel.connect("button_up", self, "set_selected", [panel, i])

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

func remove_item(item):
	var idx = inventory.find(item)
	inventory.remove(idx)
	var box
	for i in range(10):
		box = get_node("camera/inventory/Panel" + str(i))
		for sprite in box.get_children():
			sprite.queue_free()
	for i in range(inventory.size()):
		var sprite = Sprite.new()
		sprite.set_texture(load("res://assets/" + inventory[i] + ".png"))
		sprite.set_centered(false)
		box = get_node("camera/inventory/Panel" + str(i))
		box.add_child(sprite)
	if item == selected:
		selected = null
		mouse_deactivate()

func mouse_activate():
	if selected == null:
		Input.set_custom_mouse_cursor(mouse_on)

func mouse_deactivate():
	if selected == null:
		Input.set_custom_mouse_cursor(mouse_off)

func set_selected(panel, idx):
	if idx < inventory.size():
		if selected == null:
				selected = inventory[idx]
				Input.set_custom_mouse_cursor(load("res://assets/" + selected + ".png"))
		else:
			if (selected == "soap" and inventory[idx] == "rock") or (selected == "rock" and inventory[idx] == "soap"):
				remove_item("soap")
				remove_item("rock")
				add_item("chemicals")
			elif (selected == "chemicals" and inventory[idx] == "gloves") or (selected == "gloves" and inventory[idx] == "chemicals"):
				remove_item("chemicals")
				remove_item("gloves")
				add_item("chemicals+gloves")
			elif (selected == "dirty_tool" and inventory[idx] == "chemicals+gloves") or (selected == "chemicals+gloves" and inventory[idx] == "dirty_tool"):
				remove_item("dirty_tool")
				remove_item("chemicals+gloves")
				add_item("tool")

func _unhandled_input(event):
	if event.type == InputEvent.MOUSE_BUTTON and event.pressed:
		selected = null
		Input.set_custom_mouse_cursor(mouse_off)
