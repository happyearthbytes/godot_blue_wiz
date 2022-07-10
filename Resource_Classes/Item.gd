extends Resource

class_name ItemResource

export var name : String

enum ItemType {
	INVALID,
	RESOURCE,
	EQUIPMENT,
}
export(ItemType) var item_type
export var sprite : Texture
export(float, 0, 1, 0.01) var rarity
export var biome : int
export(String, MULTILINE) var flavor_text


