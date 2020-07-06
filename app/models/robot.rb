class Robot < ApplicationRecord
  has_many :weapons, dependent: :destroy
  has_many :armors, dependent: :destroy

  validates :name, presence: true
  validates :type, inclusion: { in: %w(hackerobot protectobot tacticrobot securobot attackrobot cleanerbot) }
  validates :name, uniqueness: { case_sensitive: false }
  validates :serial_number, presence: true
end
