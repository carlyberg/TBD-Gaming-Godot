extends Node2D
# written in GDscript
#Tutorial follwed - "Godot 4 TileMap Tutorial Ep3 | Placing Tiles with a Mouse Click" by Jackie on youtube

@onready var farm_map: TileMap = $FarmMap
var ground_layer = 1
var enviorment_layer = 2
var can_place_seed_cus_data = "can place seeds"

func _ready():
	pass

func _process(delta):
	pass
	
func _input(event):
	if Input.is_action_just_pressed("click"):
		var mouse_pos : Vector2 = get_global_mouse_position()
		var tile_mouse_pos : Vector2i = farm_map.local_to_map(mouse_pos)
		var source_id : int = 0
		var atlas_coord = Vector2i (11,1)
		var tile_data : TileData = farm_map.get_cell_tile_data(ground_layer, tile_mouse_pos)
		
		if tile_data:
			var can_place_seeds = tile_data.get_custom_data(can_place_seed_cus_data)
			if can_place_seeds:
				farm_map.set_cell(enviorment_layer,tile_mouse_pos, source_id, atlas_coord)
			else:
				print("Cannot Place Here")
		else:
			print("no tile data")
	
