class Reservation < ApplicationRecord
  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :people, numericality: true

  mount_uploader :img_name, ImageUploader
  belongs_to :user, optional: true
  belongs_to :room, optional: true
end
