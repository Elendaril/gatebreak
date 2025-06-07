# res://scripts/resources/StatScalingEntry.gd
extends Resource
class_name StatScalingEntry

# Enum for the stat type. This gives you a dropdown.
enum StatType {
	STRENGTH,
	ACCURACY,
	VITALITY,
	INTELLIGENCE,
	SPIRIT,
	SPEED,
	LUCK
}

enum ScalingRank {
	F, 
	E_MINUS, E, E_PLUS,
	D_MINUS, D, D_PLUS,
	C_MINUS, C, C_PLUS,
	B_MINUS, B, B_PLUS,
	A_MINUS, A, A_PLUS,
	S_MINUS, S, S_PLUS,
	SS, SSS
}

@export var stat: StatType
@export var rank: ScalingRank
