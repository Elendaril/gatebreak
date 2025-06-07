# "res://scripts/enities/EnemyStats.gd"
extends Resource
# @icon("res://path/to/your/enemy_icon.png") # Optional
class_name EnemyStats

@export_group("Basic Info")
@export var enemy_name: String = "New Enemy"
@export_multiline var description: String = ""
@export var portrait: Texture2D # For a bestiary or target info UI
@export var battle_sprite_texture: Texture2D # The sprite shown in combat

@export_group("Base Stats (at Level 1)")
@export var base_hp: int = 10
@export var base_mp: int = 0
@export var base_strength: int = 3
@export var base_accuracy: int = 3
@export var base_vitality: int = 3
@export var base_intelligence: int = 1
@export var base_spirit: int = 1
@export var base_speed: int = 2
@export var base_luck: int = 1

@export_group("Per-Level Stat Gains")
# Simple flat stats to add for each level above 1
@export var hp_per_level: int = 2
@export var str_per_level: int = 1
@export var vit_per_level: int = 1
# ... etc. for other stats that should scale with level

@export_group("Abilities & Loot")
# A static list of skills this enemy always has access to
@export var skills: Array[ActiveSkillResource] = []

# Potential drops. Key = item resource, Value = drop chance (0.0 to 1.0)
# @export var loot_table: Dictionary = {} # You can implement this later
@export_group("Behavior")
# A simple hint for the AI
enum AIType { AGGRESSIVE, DEFENSIVE, SUPPORT, TARGET_HEALERS , TARGET_CASTERS , TARGET_SINGLE_ENEMY }
@export var ai_type: AIType = AIType.AGGRESSIVE
