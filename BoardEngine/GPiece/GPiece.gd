extends Node2D

class_name GPiece

var board : GBoard


# El GPiece debe conocer su entorno
func set_board(_board : GBoard):
	board = _board
