extends AudioStreamPlayer
@export var audio : AudioStream
func _ready() -> void:
	self.stream = audio
	if self.autoplay:
		self.play()
	await Fade.on_transition_start
	var tween = create_tween()
	tween.tween_property(self, "volume_db", -50, 3)
