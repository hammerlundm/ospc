extends Sprite

var dragging = false
var offset = Vector2(0, 0)
var init_pos

func _ready():
	init_pos = get_pos()
	set_process_input(true)
	set_process(true)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		var click_pos = event.global_pos
		if event.pressed and get_node("../..").selected == null:
			var pos = get_global_pos()
			var size = get_texture().get_size()
			if check_collision(pos, size, click_pos):
				dragging = true
				get_node("../..").selected = self
				offset = Vector2(click_pos.x - pos.x, click_pos.y - pos.y)
				for i in range(8):
					if get_node("../..").state[i] == self:
						get_node("../..").state[i] = null
						break
		elif dragging:
			dragging = false
			get_node("../..").selected = null
			var slot
			for i in range(8):
				slot = get_node("../../shelf/slot" + str(i))
				if check_collision(slot.get_pos(), slot.get_size(), click_pos):
					if get_node("../..").state[i] == null:
						set_pos(slot.get_pos() + get_pos() - get_global_pos())
						get_node("../..").state[i] = self
					else:
						set_pos(init_pos)
					break
			get_node("../..").test()

func _process(delta):
	if dragging:
		set_pos(get_global_mouse_pos() + get_pos() - get_global_pos() - offset)

func check_collision(corner, size, point):
	if corner.x < point.x && corner.y < point.y && corner.x + size.x > point.x && corner.y + size.y > point.y:
		return true
	return false
