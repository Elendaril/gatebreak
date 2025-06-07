# "res://autoload/GlobalStats.gd"
extends Node

# Max HP calculation
func calculate_max_hp(base_hp: int, vit: int, str_val: int) -> int:
	return base_hp + roundi(3 * vit) + str_val

# Max MP calculation	
func calculate_max_mp(base_mp: int, spirit: int) -> int:
	return base_mp + roundi(3.0 * spirit)

# MP regen calculation - per turn 
func calculate_mp_regen(base_mp_regen: int, spirit: int) -> int:
	return base_mp_regen + roundi(0.5 * spirit)
	
# Unit physical damage
func calculate_physical_damage(base_dmg: int, str_val: int) -> int:
	return base_dmg + roundi(1.5 * str_val)

# Unit magic damage
func calculate_magic_damage(base_dmg: int, intel: int) -> int:
	return base_dmg + roundi(2.0 * intel)

# Unit defense without equipment
func calculate_defense(base_def: int, vit: int) -> int:
	return base_def + roundi(0.8 * vit)

# Unit magic defense without equipment
func calculate_magic_defense(base_mdef: int, intel: int) -> int:
	return base_mdef + roundi(0.7 * intel)

# Unit dodge rating without equipment
func calculate_dodge_rating(base_dodge: int, spd: int, lck: int) -> int:
	return base_dodge + roundi((2 * spd) + (0.5 * lck))

# Unit hit rate without equipment 
# If unit hit rate >= enemy dodge rateing hit chance == 100%
# if unit hit rate < enemy dodge rateing. (unit_hit_rate / enemy_dodge_rating) * 100 
func calculate_hit_rating(base_hit: int, acc:int, lck: int) ->int:
	return base_hit + roundi((2 * acc) + (0.5 * lck))

# Unit crit chance without equipment
func calculate_crit_chance(base_crit: int, acc: int, lck: int) -> int:
	return base_crit + roundi((0.1 * acc) + (0.3 * lck))

func calculate_hit_chance(unit_hit_rate: int,enemy_dodge_rate:int) -> int:
	if enemy_dodge_rate <= 0:
		return 999
	var hit_chance_ratio = float(unit_hit_rate) / enemy_dodge_rate
	var hit_chance_percent = hit_chance_ratio * 100.0
	return roundi(hit_chance_percent)
		
func overhit_to_crit_chance(hit_chance:int) -> int:
	if hit_chance > 100:
		return hit_chance - 100
	else:
		return 0

# Weapons stat scaling for damage
const SCALING_RANK_MULTIPLIERS = {
	"SSS": 3.0,
	"SS": 2.7,
	"S_PLUS": 2.3,
	"S": 2.2,
	"S_MINUS": 1.9,
	"A_PLUS": 1.85,
	"A": 1.8,
	"A_MINUS": 1.6,
	"B_PLUS": 1.55,
	"B": 1.5,
	"B_MINUS": 1.3,
	"C_PLUS": 1.25,
	"C": 1.2,
	"C_MINUS": 1.0,
	"D_PLUS": 0.9,
	"D": 0.8,
	"D_MINUS": 0.7,
	"E_PLUS": 0.6,
	"E": 0.5,
	"E_MINUS": 0.4,
	"F": 0.25
}
