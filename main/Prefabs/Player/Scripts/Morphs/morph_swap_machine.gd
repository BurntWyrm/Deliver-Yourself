class_name MorphSwapMachine
extends Node

@export var starting_morph: Morph
@export var current_morph: Morph

# Initialize the morph swap machine by giving each child state a reference to the
# parent object it belongs to and enter the default starting_morph.
func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent

	# Initialize to the default morph
	change_morph(starting_morph)

# Change to the new morph by first calling any exit logic on the current morph.
func change_morph(new_morph: Morph) -> void:
	if current_morph:
		current_morph.exit()

	current_morph = new_morph
	current_morph.enter()
	
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
