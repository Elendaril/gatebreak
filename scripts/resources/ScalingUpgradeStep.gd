# res://scripts/resources/ScalingUpgradeStep.gd
extends Resource
class_name ScalingUpgradeStep

# Which stat's scaling are we upgrading?
# We reuse the enum from StatScalingEntry for consistency.
@export var stat_to_upgrade: StatScalingEntry.StatType

# What level does the weapon need to be to get this upgrade?
@export var required_reinforce_level: int = 1

# What is the new rank it becomes?
@export var new_scaling_rank: StatScalingEntry.ScalingRank
