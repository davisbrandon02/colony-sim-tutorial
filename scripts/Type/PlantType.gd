class_name PlantType
extends Object

var name: String
var texture: Texture
var sourceId: int
var atlasCoords: Vector2
var navigable: bool
var maxGrowth: float
var growthPerDay: float
var drops: Array

func _init(_name, _texture, _sourceId, _atlasCoords, _navigable, _maxGrowth, _growthPerDay, _drops):
	name = _name
	texture = _texture
	sourceId = _sourceId
	atlasCoords = _atlasCoords
	navigable = _navigable
	maxGrowth = _maxGrowth
	growthPerDay = _growthPerDay
	drops = _drops

func getType():
	return PlantType
