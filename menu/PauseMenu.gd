extends CanvasLayer

signal quit_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	get_tree().paused = true

func press_continue():
	get_tree().paused = false
	self.queue_free()

func press_quit():
	get_tree().paused = false
	emit_signal("quit_game")
	self.queue_free()
