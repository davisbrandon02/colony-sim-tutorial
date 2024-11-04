class_name Grid
extends TileMap

@export var pf: Pathfinding

var grid: Dictionary = {}
@export var floorLayer: TileMapLayer
@export var objectLayer: TileMapLayer
@export var itemLayer: TileMapLayer

signal tileSelected(pos)

func initializeGrid() -> void:
	# Get all used tiles
	var usedCells = floorLayer.get_used_cells() + objectLayer.get_used_cells() + itemLayer.get_used_cells()
	for tile in usedCells:
		var cell = Cell.new()
		
		# Match the floor data
		var floorId = floorLayer.get_cell_source_id(tile)
		for floorType in FloorTypes.list:
			

func setCellFloor(_pos: Vector2, _floorType: FloorType):
	if grid.has(_pos):
		var cell: Cell = grid[_pos]
		floorLayer.set_cell(_pos, _floorType.sourceId, _floorType.atlasCoords)
		cell.floor = Floor.new(_floorType, _pos)

func setCellBuilding(_pos: Vector2, _buildingType: BuildingType = null):
	if grid.has(_pos):
		var cell: Cell = grid[_pos]
		if _buildingType:
			objectLayer.set_cell(_pos, _buildingType.sourceId, _buildingType.atlasCoords)
			cell.building = Building.new(_buildingType, _pos)
			cell.occupied = true
		else:
			objectLayer.set_cell(_pos)
			if !cell.plant and !cell.item:
				cell.occupied = false

func setCellPlant(_pos: Vector2, _plantType: PlantType):
	if grid.has(_pos):
		var cell: Cell = grid[_pos]
		objectLayer.set_cell(_pos, _plantType.sourceId, _plantType.atlasCoords)
		cell.plant = Plant.new(_plantType, _pos)

# Input - get clicked tile
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		emit_signal("tileSelected", local_to_map(get_global_mouse_position()))
