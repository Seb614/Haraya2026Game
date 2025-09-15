extends RichTextLabel
@onready var txt = [
					["Noong unang panahon, ang tanging makapangyarihang nilalang ay ang Bakunawa", 
					"In the beginning… there was only the Bakunawa"],
					["Ang sawang may bibig na kasinglaki ng isang lawa",
					"The devourer, the destroyer of worlds"],
					["Ang mananakmal na nagbabadyang lumamon sa buwan at mundo ng Haraya",
					"As it opened its gaze upon Haraya, darkness threatened to swallow all"],
					["Ngunit nagbunga ng pag-asa ang simoy ng mga Diwata ng Sinagtala",
					"But the winds of Sinagtala's diwatas rose, carrying hope across the skies"],
					["Umalab ang apoy ng mga Aswang ng Agni, kahit kailan ay hindi nagpatinag",
					"The flames of Agni's aswangs burned, refusing to be extinguished"],
					["Tumatag ang mga ugat ng Kamaliing, sa gayo'y lumakas ang mahal na Haraya",
					"The roots of Kamaliing held firm, grounding Haraya in strength "],
					["At umusbong ang dagat ng Ragatan, upang linisin ang makasalanan",
					"And the tides of Ragatan surged, cleansing with their unyielding flow"],
					["Handa ka na bang subukin ang hinaharap?",
					"Are you ready to brave what the future has in store?"]
					]
					










func _ready():
	self.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	self.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	dispText(txt[0])
	await get_tree().create_timer(3.5).timeout
	dispText(txt[1])
	await get_tree().create_timer(2.5).timeout
	dispText(txt[2])
	await get_tree().create_timer(2).timeout
	clear()
	await get_tree().create_timer(0.2).timeout
	dispText(txt[3])
	await get_tree().create_timer(1.5).timeout
	clear()
	self.get_child(0).play()
	await get_tree().create_timer(0.5).timeout
	dispText(txt[4])
	await get_tree().create_timer(2.5).timeout
	clear()
	self.get_child(0).play()
	await get_tree().create_timer(0.5).timeout
	dispText(txt[5])
	await get_tree().create_timer(2.5).timeout
	clear()
	self.get_child(0).play()
	await get_tree().create_timer(0.5).timeout
	dispText(txt[6])
	await get_tree().create_timer(3).timeout
	clear()
	self.get_child(0).play()
	await get_tree().create_timer(3).timeout
	clear()
	append_text("[pulse freq=0.5 color=ffffff00 ease=-2][font_size={24}]%s\n\n[font_size={20}][i]%s" % [txt[7][0],txt[7][1]])

func dispText(txt: Array):
	clear()
	append_text("[color=yellow][font_size={24}]%s\n\n[font_size={20}][i]%s" % [txt[0],txt[1]])
