extends Node

signal money_changed

var money: int = 0 setget _set_money

func _ready():
	call_deferred("emit_signal", "money_changed", money)

func _set_money(new_money):
	money = new_money
	emit_signal("money_changed", money)

