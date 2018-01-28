extends Camera2D

var v = Vector2(0, 0)
export(int) var SPEED

func _ready():
	set_process(true)
	get_node("right").connect("mouse_enter", self, "set_v", [SPEED])
	get_node("right").connect("mouse_exit", self, "set_v", [0])
	get_node("left").connect("mouse_enter", self, "set_v", [-SPEED])
	get_node("left").connect("mouse_exit", self, "set_v", [0])

func set_v(val):
	v.x = val

func _process(delta):
	if not get_node("../background").has_node("bookshelf"):
		if get_pos().x < get_limit(MARGIN_LEFT):
			set_pos(Vector2(get_limit(MARGIN_LEFT), 0))
		elif get_pos().x + get_viewport_rect().size.x > get_limit(MARGIN_RIGHT):
			set_pos(Vector2(get_limit(MARGIN_RIGHT) - get_viewport_rect().size.x, 0))
		translate(v*delta)
	else:
		set_v(0)
