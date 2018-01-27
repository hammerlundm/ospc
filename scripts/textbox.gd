extends Panel

var text

func _ready():
	text = get_node("text");
	set_process_input(true)

func display(text):
	set_opacity(1)
	text.set_text("[center]" + text + "[/center]")

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		set_opacity(0)
