class Project < ApplicationRecord
  has_many :project_images, -> { order(:position) }, dependent: :destroy
end
