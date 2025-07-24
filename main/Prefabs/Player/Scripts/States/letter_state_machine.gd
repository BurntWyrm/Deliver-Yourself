extends Morph

# Code for the box morph
@export_group("Morph Swap")
@export var box_morph: Morph
@export var gift_morph: Morph

@export_group("Letter States")
@export var starting_state: State
@export var current_state: State

func enter() -> void:
	print("Letter")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> Morph:
	if Input.is_action_just_pressed("Box"):
		return box_morph
	if Input.is_action_just_pressed("Gift"):
		return gift_morph
	return null

func process_frame(delta: float) -> Morph:
	return null

func process_physics(delta: float) -> Morph:
	return null
