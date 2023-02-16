extends "res://Items/Projectile/ProjectileScript.gd"

class_name ArrowProjectileClass

func _on_HitBox_body_entered(body):
    if body_can_be_damaged(body):
        body.modify_hitpoints(base_damage)
