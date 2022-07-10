extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_game():
	emit_signal("start_game")

func open_settings():
	var settings = load("res://menu/SettingsMenu.tscn").instance()
	add_child(settings)
	
