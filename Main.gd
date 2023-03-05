extends Node2D


func _ready():
    UnitFactory.loadDictionary()
    var unit = UnitFactory.createUnit("archer","ally")
    unit.position = Vector2(500,0)
    add_child(unit)
    unit.equip()

  


