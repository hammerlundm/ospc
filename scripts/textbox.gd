extends Panel

var box
var clicks = 0

func _ready():
	box = get_node("text");
	set_process_input(true)

func display(text):
	set_opacity(1)
	box.set_bbcode("[center]" + text + "[/center]")

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.pressed:
		clicks += 1
		if clicks % 2 == 0:
			set_opacity(0)
