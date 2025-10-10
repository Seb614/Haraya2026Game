extends ColorRect


@export var firefly_count := 20
@export var radius := 200.0
@export var firefly_color := Color(0.93, 0.87, 0.3, 0.0)
@export var max_glow := 1.0
@export var min_glow := 0.2
@export var move_speed := 0.8
@export var flicker_speed := 2.5
@export var light_size := 2
@onready var anchor = $anchor # reference to Marker2D

var fireflies = []


func _ready():
	# Get the anchor node
	

	
	randomize()
	for i in range(firefly_count):
		var f = ColorRect.new()
		f.color = firefly_color
		f.size = Vector2(light_size, light_size)
		f.material = CanvasItemMaterial.new()
		f.material.blend_mode = CanvasItemMaterial.BLEND_MODE_ADD
		add_child(f)
		
		var angle = randf() * TAU
		var dist = randf_range(radius * 0.3, radius)
		fireflies.append({
			"node": f,
			"angle": angle,
			"distance": dist,
			"flicker_offset": randf() * TAU,
			"orbit_speed": randf_range(0.5, 1.5)
		})

func _process(delta):
	if anchor == null:
		return
	
	for f in fireflies:
		var n = f["node"]
		var a = f["angle"]
		var dist = f["distance"]
		var orbit_speed = f["orbit_speed"]
		
		# Orbit around anchor
		a += orbit_speed * move_speed * delta
		f["angle"] = a
		
		var offset = Vector2(cos(a), sin(a)) * dist
		n.global_position = anchor.global_position + offset + Vector2(
			sin(a * 3.1) * 10.0,
			cos(a * 2.7) * 10.0
		)

		# Flicker effect (alpha pulsing)
		var flicker = (sin(Time.get_ticks_msec() / 1000.0 * flicker_speed + f["flicker_offset"]) + 1.0) / 2.0
		var alpha = lerp(min_glow, max_glow, flicker)
		n.color = Color(firefly_color.r, firefly_color.g, firefly_color.b, alpha)
