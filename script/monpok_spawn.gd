extends Node

@export var cell_size : int = int(20)

@export var probability_1 : int
@export var probability_2 : int
@export var probability_3 : int
@export var probability_4 : int
@export var probability_5 : int
@export var probability_6 : int
@export var probability_7 : int
@export var probability_8 : int
@export var probability_9 : int
@export var probability_10 : int

@export var scene_1 = PackedScene
@export var scene_2 = PackedScene
@export var scene_3 = PackedScene
@export var scene_4 : PackedScene
@export var scene_5 : PackedScene
@export var scene_6 : PackedScene
@export var scene_7 : PackedScene
@export var scene_8 : PackedScene
@export var scene_9 : PackedScene
@export var scene_10 : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("READY")
	var area_size = $ColorRect.size
	spawn_grid(area_size)
	
func spawn_grid(area_size):
	print("SpawnGrid")
	var columns = int(area_size.x / cell_size)
	var rows = int(area_size.y / cell_size)
	
	var start_pos = $ColorRect.global_position
	
	for x in range(columns):
		for y in range(rows):
			var roll = randf() * 100
			
			var spawn_pos = start_pos + Vector2(x * cell_size, y * cell_size)
			spawn_pos += Vector2(cell_size / 2.0, cell_size / 2.0)
				
				
			
			if roll < probability_8:
				continue
			elif roll < probability_9:
				spawn_object(scene_3, spawn_pos)
			elif roll < probability_10:
				spawn_object(scene_2, spawn_pos)
			else:
				spawn_object(scene_1, spawn_pos)
				
func spawn_object(scene:PackedScene, pos:Vector2):
	print("SpawnObject")
	if scene == null:
		return
	var instance = scene.instantiate()
	add_child(instance)
	if instance is AnimatableBody2D:
		instance.global_position = pos
