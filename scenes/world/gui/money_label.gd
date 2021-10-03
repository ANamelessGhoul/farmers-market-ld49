extends Label

const template: String = "%s $"

func _ready():
	Money.connect("money_changed", self, "_on_Money_money_changed")

func _on_Money_money_changed(money: int):
	text = template % money
