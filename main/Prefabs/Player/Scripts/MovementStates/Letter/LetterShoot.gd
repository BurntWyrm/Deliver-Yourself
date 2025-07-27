extends State

@export_group("Letter Movement")
@export var LetterIdle: State
@export var LetterMove: State

func enter() -> void:
	print("Letter: Fall")

func exit() -> void:
	pass

## Process Input for changing movement states
func process_input(event: InputEvent) -> State:
	if Input.get_vector("move_left","move_right","move_forward","move_back"):
		return LetterMove
	else:
		return LetterIdle
	return null

func process_frame(delta: float) -> State:
	return null

## Function that dictates what this movement state does
func process_physics(delta: float) -> State:
	return null
