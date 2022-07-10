extends Resource

class_name SettingResource

export var name : String

enum SettingType {
	INVALID,
	BOOL,
	INT,
	FLOAT,
	STRING,
	ENUM
}
export(SettingType) var setting_type
export var sprite : Texture

export(float, 0, 1, 0.001) var value

