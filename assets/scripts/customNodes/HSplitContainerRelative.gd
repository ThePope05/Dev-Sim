extends HSplitContainer

class_name HSplitContainerRelative

@export_category("Container settings")
@export var RelativeSplitOffset = 50

func _ready():
	resized.connect(_on_resize)

func _on_resize():
	var percentileOffset = (size.x / 100) * RelativeSplitOffset
	split_offset = percentileOffset
	
