extends Node

var settings = Array()

func _ready():
	var directory = Directory.new()
	directory.open("res://settings")
	directory.list_dir_begin()
	
	var filename = directory.get_next()
	while(filename):
		if not directory.current_is_dir():
			settings.append(load("res://settings/%s" % filename))
			
		filename = directory.get_next()
		
func get_setting(name):
	for s in settings:
		if s.name == name:
			return s
			
	return null
