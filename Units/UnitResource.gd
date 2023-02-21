extends Resource

class_name UnitResourceClass

enum UnitType {
    MELEE,
    RANGED
   }

enum UnitTier {
    LOW,
    MID,
    HIGH
   }

enum DamageType {
    SLASH,
    PIERCING,
    BLUNT,
    MAGIC    
   }

var unit_name : String = ''
var unit_type : String = '' #ranged/melee
var unit_tier: String = '' # low,mid,high

var resistance_vs : String = '' #slash, piercing, blunt, magic
var weakness_vs : String = '' #slash, piercing, blunt, magic

var resistance_mult : float = 0.0  
var weakness_mult : float = 0.0  

var hit_points : float = 0.0
var walking_speed: int = 0
var running_speed: int = 0

var cost: int = 0
var description : String = ''
var special : String = ''
#loads items in hand
export(PackedScene) var left_item = null
export(PackedScene) var right_item = null
#loads image for body texture
var body_texture: String = ''



