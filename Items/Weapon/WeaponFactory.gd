extends Node

class_name WeaponFactoryClass

var bow = load("res://Items/Weapon/WeaponBow.tscn")
var sword = load("res://Items/Weapon/WeaponSword.tscn")
var hammer = load("res://Items/Weapon/WeaponHammer.tscn")
var spear = load("res://Items/Weapon/WeaponSpear.tscn")
var staff = load("res://Items/Weapon/WeaponStaff.tscn")


func create_weapon(weapon, faction):
    match weapon:
        "bow":
            return bow.instance().init_weapon(faction)
        "sword":
            return sword.instance().init_weapon(faction)
        "hammer":
            return hammer.instance().init_weapon(faction)
        "spear":
            return spear.instance().init_weapon(faction)
        "staff":
            return staff.instance().init_weapon(faction)
        _:
            return null
        
