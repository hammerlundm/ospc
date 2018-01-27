extends Node2D

func _ready():
	var book
	for i in range(8):
		book = get_node("books/book" + str(i))
		
