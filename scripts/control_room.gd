extends ParallaxBackground

var transmission = preload("res://scenes/transmission.tscn")

func _ready():
	if "dirty_tool" in get_node("..").inventory or "tool" in get_node("..").inventory:
		get_node("foreground/tool").queue_free()
	else:
		get_node("foreground/tool").connect("button_up", self, "add_tool")
	get_node("foreground/transmitter").connect("button_up", self, "transmitter")
	get_node("foreground/battery").connect("button_up", self, "battery")
	get_node("foreground/button").connect("button_up", get_node("../camera/textbox"), "display", ["Don't touch that, it opens the airlock!"])
	get_node("foreground/chair").connect("button_up", get_node("../camera/textbox"), "display", ["This is no time for sitting!"])
	get_node("foreground/button2").connect("button_up", get_node("../camera/textbox"), "display", ["[i]Beep-Boop[/i]\nEven I don't know what some of these do."])

func add_tool():
	get_parent().add_item("dirty_tool")
	get_node("../camera/textbox").display("This tool needs to be cleaned, but I'll take it")
	get_node("foreground/tool").queue_free()
	get_node("..").mouse_deactivate()

func transmitter():
	var x = get_node("..")
	if x.battery_location == "transmitter":
		if x.selected == "wire":
			if "manual" in x.inventory:
				get_node("..").selected = null
				get_node("..").mouse_deactivate()
				var game = transmission.instance()
				add_child(game)
			else:
				get_node("../camera/textbox").display("I need a manual.")
		else:
			get_node("../camera/textbox").display("I need a new wire... and a manual.")
	else:
		get_node("../camera/textbox").display("It's out of power.")

func battery():
	var x = get_node("..")
	if x.selected == "battery":
		x.battery_location = "transmitter"
		x.remove_item("battery")
		get_node("../camera/textbox").display("Now I can see why this thing isn't working right.")
	elif x.battery_location == "transmitter":
		x.add_item("battery")
		x.battery_location = "inventory"
		get_node("../camera/textbox").display("I might need this.")
	else:
		get_node("../camera/textbox").display("I need to power the transmitter.")