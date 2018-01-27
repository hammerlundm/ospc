extends Control

var inventory = []

func _ready():
	pass

func add_item(item):
	var box = get_node("inventory/Panel" + str(inventory.size()))
	inventory.append(item)
	var sprite = Sprite.new()
	sprite.set_texture(load("res://assets/" + item + ".png"))
	sprite.set_centered(false)
	box.add_child(sprite)
