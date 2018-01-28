extends Sprite

var main = preload("res://scenes/main.tscn")
var done = false

func _ready():
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON and event.pressed and not done:
		queue_free()
		var game = main.instance()
		get_tree().get_root().add_child(game)
		done = true
