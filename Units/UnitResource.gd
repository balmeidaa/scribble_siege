extends Resource

class_name UnitResourceClass

enum UnitType {
    MELEE,
    RANGED
   }

enum UnitTier {
    BASIC,
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
var unit_type : int  #ranged/melee
var unit_tier: int  # low,mid,high

var resistance_vs : int  #slash, piercing, blunt, magic
var weakness_vs : int  #slash, piercing, blunt, magic

var resistance_mult : float = 0.0  
var weakness_mult : float = 0.0  

var hit_points : int = 0
var walking_speed: int = 0
var running_speed: int = 0

var cost: int = 0
var description : String = ''
var special : String = ''
#loads items in hand
#cambiar a string
var left_item : String = ''
var right_item : String = ''
#loads image for body texture
var body_texture: String = ''



