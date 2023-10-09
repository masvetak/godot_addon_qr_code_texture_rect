@tool extends TextureRect

@export var data: String = "":
	set(new_value):
		data = new_value
		_ui_update_texture()

@export var error_correct_level: QRCode.ERROR_CORRECT_LEVEL = QRCode.ERROR_CORRECT_LEVEL.LOW:
	set(new_value):
		error_correct_level = new_value
		_update_error_correct_level()
		_ui_update_texture()

@onready var _qr_code: QRCode = QRCode.new()

# ------------------------------------------------------------------------------
# Build-in methods
# ------------------------------------------------------------------------------

func _ready() -> void:
	self.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	self.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	self.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	
	_ui_update()

# ------------------------------------------------------------------------------
# Private methods
# ------------------------------------------------------------------------------

func _update_error_correct_level() -> void:
	if _qr_code == null: return
	
	_qr_code.error_correct_level = error_correct_level

# ------------------------------------------------------------------------------
# UI update methods
# ------------------------------------------------------------------------------

func _ui_update_texture() -> void:
	if _qr_code == null: return
	
	self.texture = _qr_code.get_texture(data)

func _ui_update() -> void:
	_ui_update_texture()
