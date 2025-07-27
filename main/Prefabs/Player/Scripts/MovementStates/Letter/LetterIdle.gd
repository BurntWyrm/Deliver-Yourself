extends State

@export_group("Letter Movement")
@export var LetterMove: State
@export var LetterFall: State

func enter() -> void:
	print("Letter: Idle")

func exit() -> void:
	pass

## Process Input for changing movement states
func process_input(event: InputEvent) -> State:
	if Input.get_vector("move_left","move_right","move_forward","move_back"):
		return LetterMove
	if Input.is_action_just_pressed("shoot"): ## Change to detect the floor then switch to fall
		return LetterFall
	return null

func process_frame(delta: float) -> State:
	return null

## Function that dictates what this movement state does
func process_physics(delta: float) -> State:
	return null
