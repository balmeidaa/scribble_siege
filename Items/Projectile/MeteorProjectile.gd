extends "res://Items/Projectile/ProjectileScript.gd"

class_name MeteorProjectileClass

onready var explosion_area = $ExplosionArea as Area2D

func _on_HitBox_body_entered(_body):
    detonate()

            
func detonate():
    var bodies = explosion_area.get_overlapping_bodies()
    for body in bodies:
        if body_can_be_damaged(body):
            body.modify_hitpoints(base_damage)
