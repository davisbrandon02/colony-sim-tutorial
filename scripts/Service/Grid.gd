class_name Grid
extends TileMap

@export var pf: Pathfinding

var grid: Dictionary = {}
@export var floorLayer: TileMapLayer
@export var objectLayer: TileMapLayer
@export var itemLayer: TileMapLayer

signal tile_selected(pos: Vector2i)

func initializeGrid() -> void:
	# Get all used tiles
	var usedCells = floorLayer.get_used_cells() + objectLayer.get_used_cells() + itemLayer.get_used_cells()
	for tile in usedCells:
		var cell = Cell.new()
		grid[tile] = cell
		cell.grid = self
		
		# Match the floor data
		var floorId = floorLayer.get_cell_source_id(tile)
		for floorType:FloorType in FloorTypes.list.values():
			if floorType.sourceId == floorId:
				setCellFloor(tile, floorType)
		
		# Match the object data
		var objectId = objectLayer.get_cell_source_id(tile)
		var allObjectTypes = BuildingTypes.list.values() + PlantTypes.list.values()
		for object in allObjectTypes:
			if object.sourceId == objectId:
				if object.getType() == BuildingType:
					setCellBuilding(tile, object, true)
				elif object.getType() == PlantType:
					cell.plant = Plant.new(object, tile, true)
		
		# Match the item data (if any)
		var itemId = itemLayer.get_cell_source_id(tile)
		for itemType:ItemType in ItemTypes.list.values():
			if itemType.sourceId == itemId:
				cell.item = Item.new(itemType, tile)

func setCellFloor(_pos: Vector2i, _floorType: FloorType = null):
	if grid.has(_pos):
		var cell: Cell = grid[_pos]
		if _floorType:
			floorLayer.set_cell(_pos, _floorType.sourceId, _floorType.atlasCoords)
			cell.floor = Floor.new(_floorType, _pos)
		else:
			floorLayer.set_cell(_pos, FloorTypes.list.grass)

func setCellBuilding(_pos: Vector2i, _buildingType: BuildingType = null, _built: bool = false):
	if grid.has(_pos):
		var cell: Cell = grid[_pos]
		if _buildingType:
			objectLayer.set_cell(_pos, _buildingType.sourceId, _buildingType.atlasCoords)
			cell.building = Building.new(_buildingType, _pos, _built)
		else:
			objectLayer.set_cell(_pos)

func setCellPlant(_pos: Vector2i, _plantType: PlantType = null, _mature: bool = false):
	if grid.has(_pos):
		var cell: Cell = grid[_pos]
		if _plantType:
			objectLayer.set_cell(_pos, _plantType.sourceId, _plantType.atlasCoords)
			cell.plant = Plant.new(_plantType, _pos, _mature)
		else:
			objectLayer.set_cell(_pos)

# Input - get clicked tile
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		emit_signal("tile_selected", local_to_map(get_global_mouse_position()))
