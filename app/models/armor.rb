class Armor < ApplicationRecord
  belongs_to :robot
  validates :type, inclusion: { in: ["shield", "magentic field", "water shield", "invisible field", "smoke bomb"] }
  validates :serial_number, presence: true
end
