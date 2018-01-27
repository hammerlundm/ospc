extends ParallaxBackground

func _ready():
	if "alien" in get_node("..").inventory:
		get_node("foreground/thing").queue_free()
	else:
		get_node("foreground/thing").connect("button_up", self, "thing")

func thing():
	get_parent().add_item("alien")
	get_node("../camera/textbox").display("Wow, an alien!")
	get_node("foreground/thing").queue_free()
	get_node("..").mouse_deactivate()
