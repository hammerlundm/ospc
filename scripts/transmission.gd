extends Node2D

var state = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var solution = [-1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]

func _ready():
	var button
	for i in range(16):
		button = get_node("Panel/Sprite" + str(i))
		button.connect("button_up", self, "twist", [button, i])

func twist(node, idx):
	node.set_rotation(node.get_rotation() + PI/2)
	var size = node.get_normal_texture().get_size()
	node.set_pos(node.get_pos() - size * Vector2(cos(node.get_rotation()), -sin(node.get_rotation())))
	state[idx] = (state[idx] + 1) % 4
	if test():
		print("You won!")

func test():
	for i in range(16):
		if solution[i] != -1 and solution[i] != state[i]:
			return false
	return true
