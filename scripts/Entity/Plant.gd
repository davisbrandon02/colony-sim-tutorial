class_name Plant
extends Object

var plantType: PlantType
var cell: Cell
var mature: bool

func _init(_plantType: PlantType, _cell: Cell, _mature: bool) -> void:
	plantType = _plantType
	cell = _cell
	mature = _mature

func getType():
	return Plant

func harvest():
	if mature:
		var grid: Grid = cell.grid
		grid.setCellPlant(cell.pos)
		for drop in plantType.drops:
			var nearestOpenPos = grid.getNearestUnoccupiedCell(cell.pos, 2)
			if nearestOpenPos:
				grid.setCellItem(nearestOpenPos, drop.type, drop.amount)
