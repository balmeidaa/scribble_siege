extends Node

class_name UnitFactoryClass
#singleton?
#needs file location to read data
var class_info = {} #contains all stats for all unit classes
var file_path = "res://unit_data.csv"

var unit_resource = load("res://Units/UnitResource.gd")
var unit_scene = preload("res://Units/UnitTemplate.tscn") 
    

func createUnit(type:String, faction:String):
    var new_stats = inst2dict(class_info[type])
    var new_unit = unit_scene.instance()
    ##### bug no esta duplicando recurso usan dupe(true)
    new_unit.init_unit(new_stats, faction)
    return new_unit

func loadFileData() -> Array:
    var file = File.new()
    file.open(file_path, file.READ)
    
    var keys = file.get_csv_line()
    var values = Array()
    
    while !file.eof_reached():
        var line = file.get_csv_line ()
        if line.size() > 1:
            values.append(line)
    file.close()
    
    return [keys, values]
 
func loadDictionary():
    var table = loadFileData()
    var keys = table[0]
    var values = table[1]

    for unit_class in values:
        var unit_stats = unit_resource.new()
        var unit_name = unit_class[0]
        
        for index in range(unit_class.size()):
            var key_name = keys[index]
            var var_type = typeof(unit_stats.get(key_name))
            var stat_value = unit_class[index]
            #change to String?
            if key_name in ['resistance_vs','weakness_vs']: 
                unit_stats.set(key_name, unit_stats.DamageType[stat_value])
            elif key_name == 'unit_tier':   
                unit_stats.set(key_name, unit_stats.UnitTier[stat_value])
            elif key_name == 'unit_type':
                unit_stats.set(key_name, unit_stats.UnitType[stat_value])
            else:    
                match var_type:
                    TYPE_INT:
                        unit_stats.set(key_name, int(stat_value))
                    TYPE_REAL:
                        unit_stats.set(key_name, float(stat_value))
                    _: #default String
                        unit_stats.set(key_name, String(stat_value))
        
        class_info[unit_name.to_lower()] = unit_stats


 
    
    
