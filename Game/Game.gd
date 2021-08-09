extends Node2D


func _ready():
	$Board.set_board_size(Vector2(7, 7))
	
	$Player.set_board($Board)
	
	
