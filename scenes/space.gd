extends ParallaxBackground

func _ready():
	get_node("foreground/thing").connect("button_up", self, "thing")

func thing():
	get_parent().add_item("alien")
	get_node("../textbox").display("Wow, an alien!")
	get_node("foreground/thing").queue_free()
