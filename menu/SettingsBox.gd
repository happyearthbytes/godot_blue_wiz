extends VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("game_initialized", self, "game_initialized")
	initialize()
	
func initialize():
	if GameManager.game:
		settings_changed(GameManager.game.settings)

func game_initialized(game):
	game.settings.connect("settings_changed", self, "settings_changed")

func settings_changed(settings):
	for n in get_children():
		n.queue_free()
	
	var all_settings = settings.get_settings()
	print(all_settings)
	for n in all_settings:
		var setting_label = Label.new()
		setting_label.text = "%s = %s" % [n, all_settings[n].setting_value]
		add_child(setting_label)
