class Room < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, numericality: true
  validates :address, presence: true
  # validates :img_name, presence: { message: 'を選択してください' }

  mount_uploader :img_name, ImageUploader
  belongs_to :user, optional: true
  has_many :reservations
end
