extends AudioStreamPlayer
var audio_player = AudioStreamPlayer
"audio_player.play{intro.mp3}"
func _ready():
	# Example: Fade out over 2 seconds
	fade_out(2.0)

func fade_out(duration: float):
	# Create a new tween.
	var new_tween = create_tween()
	# Set the target property to animate.
	new_tween.tween_property(audio_player, "volume_db", -100, duration) # Fades to silent

func fade_in(duration: float):
	# Example: Fade in over 1 second
	var new_tween = create_tween()
	# Set the starting volume to -100 dB and animate to 0 dB.
	audio_player.volume_db = -100
	new_tween.tween_property(audio_player, "volume_db", 0, duration)
