extends RigidBody2D

class_name UnitClass

var unit_stats : Dictionary = {}
var group_faction : String = '' 

onready var left_hand := $CollisionShape/RootBody/Torso/LeftArm/LeftItem
onready var right_hand := $CollisionShape/RootBody/Torso/RightArm/RightItem

func init_unit(unit_data, faction:String):
    self.unit_stats = unit_data
    self.group_faction = faction
  
        
func equip():

    if unit_stats.left_item != '':
        var item_temp =  WeaponFactory.create_weapon(unit_stats.left_item, group_faction)
        left_hand.add_child(item_temp)
    if unit_stats.right_item != '':
        var item_temp =  WeaponFactory.create_weapon(unit_stats.right_item, group_faction)
        right_hand.add_child(item_temp)    
