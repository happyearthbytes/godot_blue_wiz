extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var noise = null

const Levels = {
	0: [-0.66, 0],
	1: [-0.33, 1],
	2: [0,2],
	3: [0.33,3],
	4: [0.66,4],
	5: [1,5]
	}

# Called when the node enters the scene tree for the first time.
func _ready():
	noise = OpenSimplexNoise.new()
	noise.seed = randi()
	noise.octaves = 4
	noise.period = 20.0
	noise.persistence = 0.8
	var xy = get_viewport_rect().size / $TileMap.cell_size
	for x in range(xy.x):
		for y in range(xy.y):
			var tile = get_tile(x,y)
			$TileMap.set_cell(x,y,tile)
	$TileMap.update_bitmask_region()
	
func get_tile(x,y):
	var noise_value = noise.get_noise_2d(x,y)
	var rval = 0
	for v in Levels:
		if noise_value <= Levels[v][0]:
			rval = Levels[v][1]
			break
	return rval
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
