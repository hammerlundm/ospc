extends ParallaxBackground

var wire = preload("res://scenes/wire.tscn")

func _ready():
	if "rock" in get_node("..").inventory or "chemicals" in get_node("..").inventory or "chemicals+gloves" in get_node("..").inventory or "tool" in get_node("..").inventory:
		get_node("foreground/rock").queue_free()
	else:
		get_node("foreground/rock").connect("button_up", self, "add_rock")
	if "wire" in get_node("..").inventory:
		get_node("foreground/wire").queue_free()
	else:
		get_node("foreground/wire").connect("button_up", self, "add_wire")

func add_rock():
	get_parent().add_item("rock")
	get_node("../camera/textbox").display("I got a rock")
	get_node("foreground/rock").queue_free()
	get_node("..").mouse_deactivate()

func add_wire():
	if get_node("..").selected == "tool":
		var game = wire.instance()
		add_child(game)
	elif "tool" in get_node("..").inventory:
		get_node("../camera/textbox").display("I should use my tool")
	else:
		get_node("../camera/textbox").display("I need a tool to do this")