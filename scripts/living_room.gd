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

func add_gloves():
	get_parent().add_item("gloves")
	get_node("../camera/textbox").display("I need these gloves")
	get_node("foreground/gloves").queue_free()
	get_node("..").mouse_deactivate()

func add_soap():
	get_parent().add_item("soap")
	get_node("../camera/textbox").display("soap")
	get_node("foreground/soap").queue_free()
	get_node("..").mouse_deactivate()

func add_manual():
	var game = bookshelf.instance()
	add_child(game)

func add_battery():
	if "battery" in get_node("..").inventory:
		get_node("..").remove_item("battery")
		get_node("../camera/textbox").display("put the battery back")
		get_node("..").battery_location = "suit"
	else:
		get_parent().add_item("battery")
		get_node("../camera/textbox").display("got the battery")
		get_node("..").mouse_deactivate()
		get_node("..").battery_location = "inventory"
