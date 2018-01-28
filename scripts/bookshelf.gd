extends Node2D

var selected = null
var state = [null, null, null, null, null, null, null, null]

func _ready():
	get_node("quit").connect("button_up", self, "queue_free")
	var book
	for i in range(8):
		book = get_node("books/book" + str(i))
		
func test():
	for i in range(8):
		if state[i] == null or int(state[i].get_name()[-1]) != i:
			return
	queue_free()
	get_node("../..").add_item("manual")
	get_node("../../camera/textbox").display("Blah Blah Blah... Transmitters sure have a lot of wires")
	get_node("../foreground/manual").queue_free()
	get_node("../..").mouse_deactivate()
	