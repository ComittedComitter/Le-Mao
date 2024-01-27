extends Node

@onready var mic_input = $mic_input
@onready var recording_player = $recording_player
@onready var volume_bar = $volume_bar
@onready var volume_value = $volume_value

var record_bus_index: int
var record_effect: AudioEffectRecord
var recording: AudioStreamWAV
var record_live_index: int
var volume_samples: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	record_bus_index = AudioServer.get_bus_index('Record')
	# Only one effect on the bus, so can just assume index 0 for record effect
	record_effect = AudioServer.get_bus_effect(record_bus_index, 0)


func _process(_delta: float) -> void:
	update_samples_strength()
	

func update_samples_strength() -> float:
	var sample = db_to_linear(AudioServer.get_bus_peak_volume_left_db(record_live_index, 0))
	volume_samples.push_front(sample)

	# Use a while loop that way the user can adjust the number of samples at runtime
	# and remove as many as needed when the value changes
	while volume_samples.size() > 20:
		volume_samples.pop_back()

	var sample_avg = average_array(volume_samples)
	volume_value.text = '%sdb' % round(linear_to_db(sample_avg))
	volume_bar.value = round(linear_to_db(sample_avg))
	return round(linear_to_db(sample_avg))

func average_array(arr: Array) -> float:
	var avg = 0.0
	for i in range(arr.size()):
		avg += arr[i]
	avg /= arr.size()
	return avg
