extends Node2D

var main_menu_res = preload("res://menu/MainMenu.tscn")
var main_menu = null
var in_game_res = preload("res://controller/InGame.tscn")
var in_game = null

func _ready():
	main_menu()

func main_menu():
	main_menu = main_menu_res.instance()
	add_child(main_menu)
	main_menu.connect("start_game", self, "start_game")
	
func start_game():
	main_menu.queue_free()
	in_game = in_game_res.instance()
	add_child(in_game)
	in_game.connect("quit_game", self, "quit_game")
	
func quit_game():
	in_game.queue_free()
	main_menu()
