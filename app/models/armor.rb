class Armor < ApplicationRecord
  belongs_to :robot
  validates :armor_type, inclusion: { in: ["shield", "magentic field", "water shield", "invisible field", "smoke bomb"] }
  validates :serial_number, presence: true, uniqueness: true
end
