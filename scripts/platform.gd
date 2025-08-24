extends StaticBody2D

@export var texture: String

@onready var sprite = $Sprite2D
@onready var collision_shape_node = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = load("res://assets/backgrounds/" + texture)
	#sprite.scale = Vector2(scaleX, scaleY)
	
	if collision_shape_node.shape:
		var shape_size = Vector2.ZERO
		if collision_shape_node.shape is RectangleShape2D:
			shape_size = (collision_shape_node.shape as RectangleShape2D).extents * 2.0
		elif collision_shape_node.shape is CircleShape2D:
			shape_size = Vector2((collision_shape_node.shape as CircleShape2D).radius * 2.0, (collision_shape_node.shape as CircleShape2D).radius * 2.0)
		# Add more conditions for other shape types if needed

		if sprite.texture:
			var texture_size = sprite.texture.get_size()
			if texture_size.x > 0 and texture_size.y > 0:
				sprite.scale = shape_size / texture_size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
