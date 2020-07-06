class Weapon < ApplicationRecord
  belongs_to :robot
  validates :type, inclusion: { in: %w(laser code acid map grenade ray) }
  validates :serial_number, presence: true
end
