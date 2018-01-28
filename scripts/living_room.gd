extends ParallaxBackground

var bookshelf = preload("res://scenes/bookshelf.tscn")

func _ready():
	if "gloves" in get_node("..").inventory or "chemicals+gloves" in get_node("..").inventory or "tool" in get_node("..").inventory:
		get_node("foreground/gloves").queue_free()
	else:
		get_node("foreground/gloves").connect("button_up", self, "add_gloves")
	if "soap" in get_node("..").inventory or "chemicals" in get_node("..").inventory or "chemicals+gloves" in get_node("..").inventory or "tool" in get_node("..").inventory:
		get_node("foreground/soap").queue_free()
	else:
		get_node("foreground/soap").connect("button_up", self, "add_soap")
	if "manual" in get_node("..").inventory:
		get_node("foreground/manual").queue_free()
	else:
		get_node("foreground/manual").connect("button_up", self, "add_manual")
	get_node("foreground/battery").connect("button_up", self, "add_battery")
	get_node("foreground/fridge").connect("button_up", get_node("../camera/textbox"), "display", ["Space food doesn't even need to be refrigerated."])
	get_node("foreground/window").connect("button_up", get_node("../camera/textbox"), "display", ["Something Something Tyra Banks"])
	get_node("foreground/table").connect("button_up", get_node("../camera/textbox"), "display", ["[i]Waiter, table for one[/i]\nThis is where I eat, alone..."])
	get_node("foreground/chair").connect("button_up", get_node("../camera/textbox"), "display", ["*Pulls cord*"])
	get_node("foreground/ladder").connect("button_up", get_node("../camera/textbox"), "display", ["I bought this at [i]Home Depot™[/i]"])

func add_gloves():
	get_parent().add_item("gloves")
	get_node("../camera/textbox").display("Hats, gloves, scarves... Ya know, space attire.")
	get_node("foreground/gloves").queue_free()
	get_node("..").mouse_deactivate()

func add_soap():
	get_parent().add_item("soap")
	get_node("../camera/textbox").display("[i]Warning: highly reactive![/i]\nWhat kind of soap is this?")
	get_node("foreground/soap").queue_free()
	get_node("..").mouse_deactivate()

func add_manual():
	get_node("..").selected = null
	get_node("..").mouse_deactivate()
	var game = bookshelf.instance()
	add_child(game)

func add_battery():
	if get_node("..").selected == "battery":
		get_node("..").remove_item("battery")
		get_node("../camera/textbox").display("Let's put the battery back in.")
		get_node("..").battery_location = "suit"
	elif get_node("..").battery_location == "suit":
		get_parent().add_item("battery")
		get_node("../camera/textbox").display("I might need the battery.")
		get_node("..").mouse_deactivate()
		get_node("..").battery_location = "inventory"
	elif get_node("..").selected == null:
		get_node("../camera/textbox").display("I can't use this without the battery.")
