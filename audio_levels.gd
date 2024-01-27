extends VBoxContainer

@onready var volume_bar = $volume_bar

const MIN_DB: int = 80

var record_live_index: int
var volume_samples: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	record_live_index = AudioServer.get_bus_index('Record')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	update_samples_strength()

func update_samples_strength() -> void:
	var sample = db_to_linear(AudioServer.get_bus_peak_volume_left_db(record_live_index, 0))
	volume_samples.push_front(sample)

	# Use a while loop that way the user can adjust the number of samples at runtime
	# and remove as many as needed when the value changes
	while volume_samples.size() > 10:
		volume_samples.pop_back()

	var sample_avg = average_array(volume_samples)
	volume_bar.value = sample_avg
	
func average_array(arr: Array) -> float:
	var avg = 0.0
	for i in range(arr.size()):
		avg += arr[i]
	avg /= arr.size()
	return avg
