extends CanvasLayer

signal quit_game

var pause_menu_res = preload("res://menu/PauseMenu.tscn")
var pause_menu = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func pause_menu():
	pause_menu = pause_menu_res.instance()
	add_child(pause_menu)
	pause_menu.connect("quit_game", self, "quit_game")

func quit_game():
	emit_signal("quit_game")
