extends Node2D

signal quit_game

var game_ui_res = preload("res://menu/GameUI.tscn")
var game_ui = null

func _ready():
	game_ui = game_ui_res.instance()
	add_child(game_ui)
	game_ui.connect("quit_game", self, "quit_game")
	
func quit_game():
	emit_signal("quit_game")
