extends TextureButton
@onready var mat = self.material as ShaderMaterial
@export var tex : Texture2D
@export var pitch : float
func _ready() -> void:
	self.texture_normal = tex
	%sfx.pitch_scale = pitch

func burn():
	%anim.play("burn")
func glow():
	%anim.play("glow")
	await get_tree().create_timer(0.7).timeout
	%anim.play("RESET")
func failed():
	%anim.play("RESET")
	%anim.play("fail")		
func sfx():
	%sfx.play()
	await get_tree().create_timer(0.5).timeout
	@warning_ignore("standalone_expression")
	%sfx.stop
