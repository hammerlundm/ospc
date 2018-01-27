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
		if event.pressed:
			var pos = get_global_pos()
			var size = get_texture().get_size()
			if check_collision(pos, size, click_pos):
				dragging = true
				offset = Vector2(click_pos.x - pos.x, click_pos.y - pos.y)
		elif dragging:
			dragging = false
			var slot
			for i in range(8):
				slot = get_node("../../shelf/slot" + str(i))
				if check_collision(slot.get_pos(), Vector2(128, 256), click_pos):
					set_pos(slot.get_pos() + get_pos() - get_global_pos())

func _process(delta):
	if dragging:
		set_pos(get_global_mouse_pos() + get_pos() - get_global_pos() - offset)

func check_collision(corner, size, point):
	if corner.x < point.x && corner.y < point.y && corner.x + size.x > point.x && corner.y + size.y > point.y:
		return true
	return false
