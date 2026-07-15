class Project < ApplicationRecord
  has_many :project_images, -> { order(:position) }, dependent: :destroy

  # Uploaded image files (folder import or admin upload). Kept in upload order.
  has_many_attached :photos

  # Unified list of display images for the gallery, in order of preference:
  #   1. Attached photos (Active Storage)
  #   2. ProjectImage records (seeded URLs)
  #   3. The single image_url column
  # Each element responds to #display_url so views can treat them uniformly.
  def gallery
    if photos.attached?
      photos.map { |photo| GalleryItem.new(url: nil, attachment: photo) }
    elsif project_images.any?
      project_images.map { |pi| GalleryItem.new(url: pi.image_url) }
    else
      [GalleryItem.new(url: image_url)]
    end
  end

  # First image, used for grid thumbnails and the homepage hero.
  def cover_url
    gallery.first&.display_url
  end

  # Lightweight wrapper so the view can call #display_url on either an
  # Active Storage attachment or a plain URL string.
  GalleryItem = Struct.new(:url, :attachment, keyword_init: true) do
    def display_url
      attachment ? Rails.application.routes.url_helpers.rails_blob_path(attachment, only_path: true) : url
    end
  end
end
