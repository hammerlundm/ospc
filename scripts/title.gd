extends Sprite

var main = preload("res://scenes/main.tscn")

func _ready():
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		queue_free()
		var game = main.instance()
		OS.delay_msec(100)
		get_tree().get_root().add_child(game)