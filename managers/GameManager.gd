extends Node

signal player_initialized
signal game_initialized

var player
var game
var game_res = preload("res://controller/Game.tscn")


func _ready():
	pass
	
func _process(delta):
	if not game:
		initialize_game()
		return
	if not player:
		initialize_player()
		return
		
func initialize_game():
	game = game_res.instance()
	if game:
		emit_signal("game_initialized", game)
		game.settings.connect("settings_changed", self, "_on_game_settings_chaned")
		var existing_settings = load("user://settings.tres")
		if existing_settings:
			game.settings.set_settings(existing_settings.get_settings())
		else:
			game.settings.set_setting("volume", 0.5)
						
func _on_game_settings_chaned(settings):
	ResourceSaver.save("user://settings.tres", settings)

func initialize_player():
	player = get_tree().get_root().get_node("/root/player/player")
	if player:
		emit_signal("player_initialized", player)
		player.inverntory.connect("inventory_changed", self, "_on_player_inventory_chaned")		
		var existing_inventory = load("user://inventory.tres")
		if existing_inventory:
			player.inventory.set_items(existing_inventory.get_items())
		else:
			player.inventory.add_items("soul")
				
func _on_player_inventory_changed(inventory):
	ResourceSaver.save("user://inventory.tres", inventory)
