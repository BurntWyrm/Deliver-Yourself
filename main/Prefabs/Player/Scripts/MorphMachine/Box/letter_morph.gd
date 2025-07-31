extends State

@export_group("Morphs")
@export var Gift: State
@export var Box: State
@onready var movement_machine: Node = $MovementMachine

func enter() -> void:
	print("Morph: Letter")
	movement_machine.init(parent)
	parent.animation_player.play("Letter_Morph")

func exit() -> void:
	movement_machine.deinit()

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

# Passes functions to the movement states
func _unhandled_input(event: InputEvent) -> void:
	movement_machine.process_input(event)

func _physics_process(delta: float) -> void:
	movement_machine.process_physics(delta)

func _process(delta: float) -> void:
	movement_machine.process_frame(delta)
