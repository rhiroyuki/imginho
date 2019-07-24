# frozen_string_literal: true

class ImageUploader < Shrine
  ALLOWED_TYPES = %w[image/jpeg image/png]
  MAX_SIZE      = 10*1024*1024 # 10 MB

  plugin :remove_attachment
  plugin :pretty_location
  plugin :validation_helpers
  plugin :store_dimensions, analyzer: :mini_magick

  # File validations (requires `validation_helpers` plugin)
  Attacher.validate do
    validate_max_size MAX_SIZE
    if validate_mime_type_inclusion(ALLOWED_TYPES)
      validate_max_width 5000
      validate_max_height 5000
    end
  end
end
