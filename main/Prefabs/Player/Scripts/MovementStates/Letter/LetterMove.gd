extends State

@export_group("Gift Movement")
@export var LetterIdle: State
@export var LetterFall: State

func enter() -> void:
	print("Letter: Move")

func exit() -> void:
	pass

## Process Input for changing movement states
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("shoot"): ## Swap to floor detection
		return LetterFall
	else:
		return LetterIdle
	return null

func process_frame(delta: float) -> State:
	return null

## Function that dictates what this movement state does
func process_physics(delta: float) -> State:
	return null
