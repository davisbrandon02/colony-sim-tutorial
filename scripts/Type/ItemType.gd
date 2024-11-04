class_name ItemType
extends Object

var name: String
var texture: Texture
var sourceId: int
var atlasCoords: Vector2
var maxStack: int

func _init(_name, _texture, _sourceId, _atlasCoords, _maxStack) -> void:
	name = _name
	texture = _texture
	sourceId = _sourceId
	atlasCoords = _atlasCoords
	maxStack = _maxStack
