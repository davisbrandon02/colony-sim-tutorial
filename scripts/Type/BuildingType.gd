class_name BuildingType
extends Object

var name: String
var texture: Texture
var sourceId: int
var atlasCoords: Vector2

func _init(_name, _texture, _sourceId, _atlasCoords):
	name = _name
	texture = _texture
	sourceId = _sourceId
	atlasCoords = _atlasCoords
