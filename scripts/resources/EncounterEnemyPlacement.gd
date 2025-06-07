# res://scripts/resources/EncounterEnemyPlacement.gd
# This small resource just holds the data for ONE enemy in a formation.
extends Resource
class_name EncounterEnemyPlacement

# Link to the EnemyStats.tres file (e.g., GoblinWarrior.tres)
@export var enemy_stats: EnemyStats 

# The level of this specific enemy for this encounter.
@export var level: int = 1

# Where this enemy appears on the 3x3 grid.
# x is the column (0=left, 1=middle, 2=right)
# y is the row (0=front, 1=middle, 2=back)
@export var grid_position: Vector2i = Vector2i.ZERO 
