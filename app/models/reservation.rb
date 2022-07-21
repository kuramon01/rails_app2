class Reservation < ApplicationRecord
  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :people, numericality: true

  belongs_to :user
  belongs_to :room
end
