extends ParallaxBackground

var transmission = preload("res://scenes/transmission.tscn")

func _ready():
	if "dirty_tool" in get_node("..").inventory or "tool" in get_node("..").inventory:
		get_node("foreground/tool").queue_free()
	else:
		get_node("foreground/tool").connect("button_up", self, "add_tool")
	get_node("foreground/transmitter").connect("button_up", self, "transmitter")

func add_tool():
	get_parent().add_item("dirty_tool")
	get_node("../camera/textbox").display("This tool needs to be cleaned")
	get_node("foreground/tool").queue_free()
	get_node("..").mouse_deactivate()

func transmitter():
	var x = get_node("..")
	if x.selected == "battery":
		x.battery_location = "transmitter"
		x.remove_item("battery")
		get_node("../camera/textbox").display("Put battery in the transmitter")
	elif x.battery_location == "transmitter":
		if x.selected == "wire":
			if "manual" in x.inventory:
				var game = transmission.instance()
				add_child(game)
			else:
				get_node("../camera/textbox").display("I need a manual")
		else:
			get_node("../camera/textbox").display("I need a new wire")
			x.add_item("battery")
			x.battery_location = "inventory"
	else:
		get_node("../camera/textbox").display("it's broken")
