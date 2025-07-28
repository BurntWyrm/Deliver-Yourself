class_name Player
extends RigidBody3D

@onready var morph_machine: Node = $MorphMachine
@onready var _camera: Camera3D
@onready var _player_camera: PhantomCamera3D

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	morph_machine.init(self)

	_camera = owner.get_node("%MainCamera3D")
	_player_camera = owner.get_node("%PlayerPhantom")

func _unhandled_input(event: InputEvent) -> void:
	morph_machine.process_input(event)

func _physics_process(delta: float) -> void:
	morph_machine.process_physics(delta)

func _process(delta: float) -> void:
	morph_machine.process_frame(delta)
