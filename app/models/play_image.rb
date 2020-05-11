class PlayImage < ApplicationRecord
  has_many_attached :images

  validate :acceptable_image

  def acceptable_image
    return unless images.attached?

    acceptable_types = ["image/jpeg", "image/png"]
    images.each do |image|
      unless acceptable_types.include?(image.content_type)
        return errors.add(:images, "must be a JPEG or PNG")
      end
    end
  end
end
