extends KinematicBody2D

var time = 0

func _ready():
	set_process(true)

func _process(delta):
	move(Vector2(20*sin(4*time), 0))
	time += delta
