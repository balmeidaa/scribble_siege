extends KinematicBody2D
class_name WeaponClass

export var weapon_name : String = ''

enum WeaponType {
    MELEE,
    RANGED
   }

enum DamageType {
    SLASH,
    BLUNT,
    PIERCING,
    MAGIC
   }

#Default Value
export (WeaponType) var weapon_type = WeaponType.MELEE
export (DamageType) var damage_type = DamageType.SLASH
 

# Enemy or Ally, this to discard friendly fire
var group_faction : String = '' 
export var base_damage: float = 0.0

#for melee
onready var hit_box : Area2D = $HitBox
#for ranged weappons
var target_position : Vector2 = Vector2()
onready var projectile_position : Position2D = $ProjectilePosition
export(PackedScene) var projectile_scene = null


func _ready():
    pass # Replace with function body.

func init_weapon(faction: String):    
    self.group_faction = faction
    return self
    
func attack():
    match weapon_type:
        "melee":
            meleeAtack()
        "ranged":
            rangedAttack()
        "magic":
            magicAttack()
        _:
            return
            
        
func meleeAtack():
    ##trigger animation
    pass

            
            

func rangedAttack():
    ##trigger animation
    if is_projectile_defined():
        var projectile = projectile_scene.instance()
        projectile.init_projectile(group_faction) 
        projectile.set_as_toplevel(true)
        projectile.transform = projectile_position.global_transform
        add_child(projectile)
        projectile.launch()#pass direction later
        #add throwing code
       
        

func magicAttack():
    ##trigger animation
    if is_projectile_defined():
        pass


func is_projectile_defined():
    return true if projectile_scene else false


func _on_HitBox_body_entered(body):
    if not body.is_in_group(group_faction) and body.has_method("modify_hitpoints"):
        body.modify_hitpoints(base_damage)
