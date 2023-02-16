extends RigidBody2D

class_name ProjectileClass


onready var hit_box = $Hitbox as Area2D

export var base_damage : int = 0
export var friendly_fire_on : bool = true
var group_faction : String = '' 


func _init(group_faction: String):    
    self.group_faction = group_faction

func _on_HitBox_body_entered(body):
    pass # Replace with function body.

func body_can_be_damaged(body)->bool:
    return body.has_method("modify_hitpoints") if friendly_fire_on else not body.is_in_group(group_faction) and body.has_method("modify_hitpoints")
    
    
