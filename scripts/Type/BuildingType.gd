class_name BuildingType
extends Object

var name: String
var texture: Texture
var sourceId: int
var atlasCoords: Vector2
var navigable: bool

func _init(_name, _texture, _sourceId, _atlasCoords, _navigable):
	name = _name
	texture = _texture
	sourceId = _sourceId
	atlasCoords = _atlasCoords
	navigable = _navigable

func getType():
	return BuildingType
