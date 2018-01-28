extends Panel

var box

func _ready():
	box = get_node("text");
	set_process_input(true)

func display(text):
	set_opacity(1)
	box.set_bbcode("[center]" + text + "[/center]")

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.pressed:
		set_opacity(0)
