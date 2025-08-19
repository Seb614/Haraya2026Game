extends CharacterBody2D

class_name Player

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 100.0
const JUMP_VELOCITY = -250.0

var sprite_frames = preload("res://assets/sprites/player_anims.tres")

func _ready():
	$AnimatedSprite2D.frames = sprite_frames
	$AnimatedSprite2D.play("idle_right")  # Replace with your animation name
	NavManager.on_trigger_player_spawn.connect(_on_spawn)

@warning_ignore("shadowed_variable_base_class")
func _on_spawn(position: Vector2, direction: String):
	global_position = position
	animated_sprite.frames = sprite_frames
	animated_sprite.play("idle_right")
	
	if direction == "left":
			animated_sprite.flip_h = true  # Face left
	elif direction == "right":
			animated_sprite.flip_h = false # Face right
			
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump_right")
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		
		if not is_on_floor():
			$AnimatedSprite2D.play("jump_right")
		else:
			$AnimatedSprite2D.play("walk_right")
		
		
		
		if velocity.x < 0:
			animated_sprite.flip_h = true  # Face left
		elif velocity.x > 0:
			animated_sprite.flip_h = false # Face right

		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if (velocity.y == 0):
			$AnimatedSprite2D.play("idle_right")

	move_and_slide()


func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("idle_right")
