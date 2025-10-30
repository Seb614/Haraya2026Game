extends AudioStreamPlayer
@export var audio : AudioStream
@export var seek : float
var stop
func _ready() -> void:
	self.stream = audio
	if self.autoplay:
		self.play()
	await Fade.on_transition_start
	stop = self.get_playback_position() + 0.5
	var tween = create_tween()
	tween.tween_property(self, "volume_db", -50, 0.5)
