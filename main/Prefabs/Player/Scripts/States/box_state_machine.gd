extends Morph

# Code for the box morph

@export var gift_morph: Morph
@export var letter_morph: Morph

func enter() -> void:
	print("Box")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> Morph:
	if Input.is_action_just_pressed("Gift"):
		return gift_morph
	if Input.is_action_just_pressed("Letter"):
		return letter_morph
	return null

func process_frame(delta: float) -> Morph:
	return null

func process_physics(delta: float) -> Morph:
	return null
