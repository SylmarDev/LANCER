extends TileMap
class_name RotTileMap

func eraseCell(index: int, cell: Vector2):
	erase_cell(index, cell)
	get_parent().deleteRotAtCoords(cell.x, cell.y)

func hitBy(body):
	var surrounding = get_surrounding_cells(local_to_map(body.position + Vector2(388, 388)))
	eraseCell(0, local_to_map(body.position + Vector2(388, 388)))
	for pos in surrounding:
		eraseCell(0, pos)
		for pos_2 in get_surrounding_cells(pos):
			eraseCell(0, pos_2) 
			update_surrounding(pos_2)
	
func update_surrounding(pos: Vector2):
	var surrounding = get_surrounding_cells(pos)
	var to_update = []
	for cell in surrounding:
		if get_cell_source_id(0, cell) != -1:
			to_update += [cell]
	for cell in to_update:
		set_cell(0, cell)
	set_cells_terrain_connect(0, to_update, 0, 0)