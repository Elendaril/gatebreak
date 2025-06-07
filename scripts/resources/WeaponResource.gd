# res://scripts/resources/WeaponResource.gd
# @icon("res://path/to/your/weapon_icon.png") TODO: Prepare icon
extends Resource
class_name WeaponResource

@export_group("Basic Info")
@export var weapon_name: String = "New Weapon"
@export_multiline var description: String = ""

enum WeaponType {
	SWORD,
	AXE,
	DAGGER,
	STAFF,
	BOW
	# Add more as needed
}
@export var weapon_type: WeaponType = WeaponType.SWORD

enum WeaponRange {
	MELEE, # only first row
	RANGED, # can target all fields but can target row before unit (you can attack melee units if you are in first row)
	REACH, # first and second row (for example spear)
}
@export var weapon_range: WeaponRange = WeaponRange.MELEE

@export_group("Core Stats")
@export var base_damage: int = 10
# You could add other direct bonuses here, like:
@export var crit_chance_bonus: int = 0
@export var attack_speed_modifier: int = 0 # can by negative for slow 2handed weapons, delaying unit turn as penalty

@export_group("Stat Scaling")
@export var stat_scaling: Array[StatScalingEntry] = []

@export_group("Upgrading")
@export var max_reinforce_level: int = 5
@export var damage_increase_per_level_percent: float = 0.1 # 10% per level
@export var scaling_upgrade_path: Array[ScalingUpgradeStep] = [] # The upgrade path

@export_group("Requirements")
@export var required_level: int = 1
# You could also add stat requirements to wield the weapon
@export var required_strength: int = 0
@export var required_intelligence: int = 0
@export var required_accuracy : int = 0
@export var required_vitality : int = 0
@export var required_spirit : int = 0
@export var required_speed : int = 0
@export var required_luck: int = 0
