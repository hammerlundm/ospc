extends Sprite

var clicks = 1

func _ready():
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		clicks += 1
		if clicks % 3 == 0:
			get_tree().quit()
		