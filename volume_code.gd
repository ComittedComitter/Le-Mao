extends MarginContainer

@onready var mic_input = $mic_input
@onready var recording_player = $recording_player

var record_bus_index: int
var record_effect: AudioEffectRecord
var recording: AudioStreamWAV

# Called when the node enters the scene tree for the first time.
func _ready():
	record_bus_index = AudioServer.get_bus_index('Record')
	# Only one effect on the bus, so can just assume index 0 for record effect
	record_effect = AudioServer.get_bus_effect(record_bus_index, 0)
	

func start_recording() -> void:
	record_effect.set_recording_active(true)
	
func stop_recording() -> void:
	record_effect.set_recording_active(false)

