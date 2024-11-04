class_name PlantType
extends Object

var name: String
var texture: Texture
var sourceId: int
var atlasCoords: Vector2
var maxGrowth: float
var growthPerDay: float
var drops: Array[Item]

func _init(_name, _texture, _sourceId, _atlasCoords, _maxGrowth, _growthPerDay, _drops):
	name = _name
	texture = _texture
	sourceId = _sourceId
	atlasCoords = _atlasCoords
	maxGrowth = _maxGrowth
	growthPerDay = _growthPerDay
	drops = _drops
