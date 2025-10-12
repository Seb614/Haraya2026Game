extends RichTextLabel

@export var inpText := "hi"

func _ready():
	text = "[color=gold][font size=80] [outline_size=20 outline_color=brown][shake rate=10 level=100 ]" + inpText 
