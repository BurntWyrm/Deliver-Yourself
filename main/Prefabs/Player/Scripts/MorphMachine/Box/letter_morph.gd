extends State

@export_group("Morphs")
@export var Gift: State
@export var Box: State

func enter() -> void:
	print("Morph: Letter")

func exit() -> void:
	pass

## Process Input for changing morphs
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("Box"):
		return Box
	if Input.is_action_just_pressed("Gift"):
		return Gift
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
