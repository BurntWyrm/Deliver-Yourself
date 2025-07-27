extends State

@export_group("Morphs")
@export var Box: State
@export var Letter: State
@onready var movement_machine: Node = $MovementMachine

func enter() -> void:
	print("Morph: Gift")
	movement_machine.init(parent)

func exit() -> void:
	movement_machine.deinit()

## Process Input for changing morphs
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("Box"):
		return Box
	if Input.is_action_just_pressed("Letter"):
		return Letter
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

# Passes functions to the movement states
func _unhandled_input(event: InputEvent) -> void:
	movement_machine.process_input(event)

func _physics_process(delta: float) -> void:
	movement_machine.process_physics(delta)

func _process(delta: float) -> void:
	movement_machine.process_frame(delta)
