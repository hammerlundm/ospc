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
	get_node("foreground/moon").connect("button_up", get_node("../camera/textbox"), "display", ["Awoooo!"])
	get_node("foreground/alien").connect("button_up", get_node("../camera/textbox"), "display", ["A friend! But she's just out of reach."])
	get_node("foreground/battery").connect("button_up", get_node("../camera/textbox"), "display", ["Almost fully charged!"])
	get_node("foreground/oxygen").connect("button_up", get_node("../camera/textbox"), "display", ["[i]Tell me how I'm supposed to breathe with no air.[/i]"])

func add_rock():
	get_parent().add_item("rock")
	get_node("../camera/textbox").display("It's not just a boulder... It's a rock!")
	get_node("foreground/rock").queue_free()
	get_node("..").mouse_deactivate()

func add_wire():
	if get_node("..").selected == "tool":
		get_node("..").selected = null
		get_node("..").mouse_deactivate()
		var game = wire.instance()
		add_child(game)
	elif get_node("..").selected == "dirty_tool":
		get_node("../camera/textbox").display("This tool is too dirty to use.")
	elif "tool" in get_node("..").inventory:
		get_node("../camera/textbox").display("I should use my tool.")
	else:
		get_node("../camera/textbox").display("I could steal a wire from there if I had the right tool.")
