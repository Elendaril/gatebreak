# res://scripts/entities/RuntimeUnit.gd
## Creates runtime copy of unit resorce for editing and saving
# Initializes:
# - `unit_stats_instance`: a unique duplicate of the provided stats resource.
# - `display_name`: either from override or copied from the stats.
# - `unique_id`: generated using system time and random value.
class_name RuntimeUnit
extends Object # Or RefCounted if I prefer automatic memory management

var unique_id: String # For saving and loading
var display_name: String
var unit_stats_instance: UnitStats # This will be a DUPLICATE of the .tres file for modification
# var currenct_class_instance: UnitClass # This might also duplicate if clsses have XP/Level per unit
var current_level: int = 1
var current_exp: int = 0

# var mastered_classes: Array[UnitClass] = []
# var equipped_mastered_passives: Array[PassiveSkillResource] = []
# var combat_skill_loadout: Array[ActiveSkillResource] = [] # Max 6

var max_legacy_points: int = 0
var current_legacy_points_spent: int = 0

var is_unconscious: bool = false
var is_dead: bool = false
# ... any other runtime-specific data ...

# Constructor
## Creates runtime copy of unit resorce for editing and saving
# @param p_base_stats_template (UnitStats): The base unit stats resource to duplicate.
#        This must not be null, as it forms the foundation for the runtime unit.
# @param p_display_name_override (String, optional): If provided, overrides the unit's
#        display name. If not provided, defaults to the name defined in the unit stats.
#
# Initializes:
# - `unit_stats_instance`: a unique duplicate of the provided stats resource.
# - `display_name`: either from override or copied from the stats.
# - `unique_id`: generated using system time and random value.
func _init(p_base_stats_template: UnitStats,p_display_name_override: String = ""):
	if not p_base_stats_template:
		printerr("RunetimeUnitt: p_base_stats_template cannot be null.")
		return
	
	self.unit_stats_instance = p_base_stats_template.duplicate(true) # CRITICAL: Duplicate for unique instance!

	if p_display_name_override != "":
		self.display_name = p_display_name_override
	else:
		self.display_name = self.unit_stats_instance.unit_name

	self.unique_id = "RU_" + str(Time.get_unix_time_from_system()) + "_" + str(randi() % 1000) # Simple unique ID generation
	# Initialize other properties like mastered_classes, loadouts, LP, etc. as needed for new unit
	# For example, calculate intital max_legacy_points based on lvl 1
	# self.max_legacy_points = GlobalStats.calculate_ma_legacy_points(self.current_level)
	
	print("Created RuntimeUnit: ",self.display_name)
# I will need methods here to level up, change class, equip skills, etc
# These methods will modify this RuntimeUnit instance's data.
