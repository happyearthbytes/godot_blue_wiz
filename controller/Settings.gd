extends Node

class_name Settings

signal settings_chaned

export var _settings = Dictionary() setget set_settings, get_settings

func set_settings(new_settings):
	_settings = new_settings
	emit_signal("settings_changed", self)
	
func get_settings():
	return _settings
	
func get_setting(setting_name):
	return _settings.get(setting_name)
	
func set_setting(setting_name, value):
	var setting = SettingDatabase.get_setting(setting_name)
	if setting:
		var new_setting = {
			setting_ref = setting,
			setting_value = value
		}
		_settings[setting_name] = new_setting
		emit_signal("settings_changed", self)
