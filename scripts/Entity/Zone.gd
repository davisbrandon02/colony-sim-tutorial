class_name Zone
extends Object

var cells: Array[Cell]

func addCells(_cells: Array[Cell]):
	cells.append(_cells)

func removeCells(_cells: Array[Cell]):
	for c:Cell in _cells:
		cells.erase(c)
