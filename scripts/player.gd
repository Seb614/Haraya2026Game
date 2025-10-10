extends CharacterBody2D

class_name Player

@onready var animated_sprite = $AnimatedSprite2D

@export var limitL : float = -300
@export var limitR : float = 300

var SPEED = 100.0
const JUMP_VELOCITY = -250.0

var sprite_frames = preload("res://assets/sprites/player_anims.tres")

func _ready():
	$AnimatedSprite2D.frames = sprite_frames
	$AnimatedSprite2D.play("idle_right")  # Replace with your animation name
	NavManager.on_trigger_player_spawn.connect(_on_spawn)
	
	$Camera2D.limit_left = limitL
	$Camera2D.limit_right = limitR

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
		
	if Input.is_action_pressed("sprint") and is_on_floor():
		SPEED = 150.0
		#$Control/Sprint.visible = true
	else:
		SPEED = 100.0
		#$Control/Sprint.visible = false
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		print(SPEED)
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

#func _process(_float) -> void:
	#if self.position.y >= 100:
		#Fade.transition()
		#await Fade.on_transition_finished
		#Fade.get_tree().change_scene_to_file("res://scenes/screens/scene2.tscn")

func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("idle_right")
