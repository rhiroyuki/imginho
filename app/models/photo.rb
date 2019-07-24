# frozen_string_literal: true

class Photo < Sequel::Model
  include ImageUploader::Attachment.new(:image)
end
