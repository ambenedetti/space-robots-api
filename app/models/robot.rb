class Robot < ApplicationRecord
  has_many :weapons, dependent: :destroy
  has_many :armors, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :robot_type, inclusion: { in: %w(hackerobot protectobot tacticrobot securobot attackrobot cleanerbot) }
  validates :serial_number, presence: true, uniqueness: true
end
