extends TextureButton
@onready var mat = self.material as ShaderMaterial
func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(mat, "shader_parameter/burn_progress", 1.0, 3)
