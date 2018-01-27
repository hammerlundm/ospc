extends KinematicBody2D

var time = 0

func _ready():
	set_process(true)

func _process(delta):
	move(Vector2(15*sin(2*time), 0))
	time += delta