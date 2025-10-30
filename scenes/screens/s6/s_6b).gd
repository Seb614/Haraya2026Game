extends Node2D

var scorecam
var playercam

@export var dialogue_resource: DialogueResource

var ctr = 0
var collected = [false, false, false, false, false, false]
var complete = false

func _ready() -> void:
	get_node("Player/Label").visible = true
	print(get_node("Player/Label").visible)
	DialogueManager.show_dialogue_balloon(dialogue_resource, "start")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("Player/Label").text = str(ctr) + "/6"
	if ctr == 6 and !complete:
		complete = true
		get_node("Player/Pulse").show()
		get_node("Player/AnimationPlayer").play("pulse")
		await get_node("Player/AnimationPlayer").animation_finished
		get_node("Player/Pulse").hide()

func _on_area_1_body_entered(body: Node2D) -> void:
	if body.name == "Player" and !collected[0]:
		collected[0] = !collected[0]
		ctr += 1
		get_node("pieces/Piece1").hide()
		get_node("pieces/Area2").hide()
		get_node("Player/Node2D/Piece1").visible = true
		print(ctr)
		DialogueManager.show_dialogue_balloon(dialogue_resource, "piece1")
		

func _on_area_2_body_entered(body: Node2D) -> void:
	if body.name == "Player" and !collected[1]:
		collected[1] = !collected[1]
		ctr += 1
		get_node("pieces/Piece2").hide()
		get_node("pieces/Area2").hide()
		get_node("Player/Node2D/Piece2").visible = true
		print(ctr)
		DialogueManager.show_dialogue_balloon(dialogue_resource, "piece6")


func _on_area_3_body_entered(body: Node2D) -> void:
	if body.name == "Player" and !collected[2]:
		collected[2] = !collected[2]
		ctr += 1
		get_node("pieces/Piece3").hide()
		get_node("pieces/Area3").hide()
		get_node("Player/Node2D/Piece3").visible = true
		print(ctr)
		DialogueManager.show_dialogue_balloon(dialogue_resource, "piece3")


func _on_area_4_body_entered(body: Node2D) -> void:
	if body.name == "Player" and !collected[3]:
		collected[3] = !collected[3]
		ctr += 1
		get_node("pieces/Piece4").hide()
		get_node("pieces/Area4").hide()
		get_node("Player/Node2D/Piece4").visible = true
		print(ctr)
		DialogueManager.show_dialogue_balloon(dialogue_resource, "piece4")


func _on_area_5_body_entered(body: Node2D) -> void:
	if body.name == "Player" and !collected[4]:
		collected[4] = !collected[4]
		ctr += 1
		get_node("pieces/Piece5").hide()
		get_node("pieces/Area5").hide()
		get_node("Player/Node2D/Piece5").visible = true
		print(ctr)
		DialogueManager.show_dialogue_balloon(dialogue_resource, "piece5")


func _on_area_6_body_entered(body: Node2D) -> void:
	if body.name == "Player" and !collected[5]:
		collected[5] = !collected[5]
		ctr += 1
		get_node("pieces/Piece6").hide()
		get_node("pieces/Area6").hide()
		get_node("Player/Node2D/Piece6").visible = true
		print(ctr)
		DialogueManager.show_dialogue_balloon(dialogue_resource, "piece2")
