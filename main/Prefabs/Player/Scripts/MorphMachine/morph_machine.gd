extends Node

@onready var morphing_cd: Timer = %MorphingCD

@export_group("Morph States")
@export var starting_morph: State
@export var current_morph: State

@export_group("Morph Stats")
@export var cooldown: bool = true

var can_morph = true

# Initialize the state machine by giving each child state a reference to the
# parent object it belongs to and enter the default starting_state.
func _ready() -> void:
	print("Morph Machine: Active")

func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent

	# Initialize to the default state
	change_morph(starting_morph)

# Change to the new state by first calling any exit logic on the current state.
func change_morph(new_morph: State) -> void:
	if not can_morph and cooldown:
		return
	
	if current_morph:
		current_morph.exit()

	current_morph = new_morph
	current_morph.enter()
	
	if cooldown:
		can_morph = false
		morphing_cd.start()

# Pass through functions for the Player to call,
# handling state changes as needed.
func process_physics(delta: float) -> void:
	var new_morph = current_morph.process_physics(delta)
	if new_morph:
		change_morph(new_morph)

func process_input(event: InputEvent) -> void:
	var new_morph = current_morph.process_input(event)
	if new_morph:
		change_morph(new_morph)

func process_frame(delta: float) -> void:
	var new_morph = current_morph.process_frame(delta)
	if new_morph:
		change_morph(new_morph)

func _on_morphing_cd_timeout() -> void:
	can_morph = true
