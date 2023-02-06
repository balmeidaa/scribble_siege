extends Node

var unit_name : String = ''
var unit_type : String = '' #ranged/melee/magic

var resistance_vs : String = '' #slash, piercing, blunt, magic
var weakness_vs : String = '' #slash, piercing, blunt, magic

var resistance_mult : float = 0.0  
var weakness_mult : float = 0.0  

var hit_points : float = 0.0
var walking_speed: int = 0
var running_speed: int = 0



func _ready():
    pass # Replace with function body.


