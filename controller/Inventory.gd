extends Node

class_name Inventory

signal inventory_chaned

export var _items = Array() setget set_items, get_items

func set_items(new_items):
	_items = new_items
	emit_signal("inventory_changed", self)
	
func get_items():
	return _items
	
func get_item(index):
	return _items[index]
	
func add_item(item_name):
	var item = ItemDatabase.get_item(item_name)
	if item:
		var new_item = {
			item_ref = item
		}
		_items.append(new_item)
		emit_signal("inventory_chaned", self)
