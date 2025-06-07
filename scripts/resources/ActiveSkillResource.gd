# res://scripts/resources/ActiveSkillResource.gd
extends Resource
class_name ActiveSkillResource

# --- Basic Info ---
@export_group("Basic Info")
@export var skill_name: String = "New Skill"
@export_multiline var description: String = "Does something cool."
@export var skill_icon: Texture2D

# --- Cost ---
@export_group("Cost")
@export var mp_cost: int = 0
@export var hp_cost: int = 0 # For skills that use health as a resource
@export var cooldown: int = 0 # how many turns you have to wait to use it again, resets to 0 on combat end
# You could add a stamina_cost here too if you use stamina in combat

# --- Targeting Rules ---
@export_group("Targeting")
enum TargetType { ENEMY, ALLY, SELF }
@export var target_type: TargetType = TargetType.ENEMY


enum TargetScope { SINGLE, ROW, COLUMN, ALL_IN_AREA, ADJACENT, ALL_ENEMIES, ALL_ALLIES, ALL_FIELDS }
@export var target_scope: TargetScope = TargetScope.SINGLE

enum SkillRange { MELEE, REACH, RANGED, ANY }
@export var skill_range: SkillRange = SkillRange.MELEE

# --- Skill Effects ---
@export_group("Effects")

enum DamageType { PHYSICAL, MAGICAL, FIRE, ICE, HEALING, PURE }
@export var damage_type: DamageType = DamageType.PHYSICAL

@export var base_damage: int = 0 # Flat damage amount
@export var power_multiplier: float = 1.0 # e.g., 1.5 = 150% of STR or INT

# For healing skills
@export var base_heal: int = 0
@export var heal_multiplier: float = 1.0 # e.g., 1.5 = 150% of SPIRIT

# This will be a percentage. 0.0 = no variance. 0.1 = +/- 10% variance.
@export_range(0.0, 1.0, 0.01) var damage_variance: float = 0.0 

# For status effects (you would need a StatusEffectResource script)
# @export var applies_status_effect: StatusEffectResource
# @export var status_effect_chance: float = 1.0 # 1.0 = 100%

# --- Visuals ---
@export_group("Visuals")
# @export var animation_name: String # Identifier for an animation to play
# @export var vfx_scene: PackedScene # A scene for visual effects (e.g., fireball
