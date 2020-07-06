class Weapon < ApplicationRecord
  belongs_to :robot
  validates :weapon_type, inclusion: { in: %w(laser code acid map grenade ray) }
  validates :serial_number, presence: true, uniqueness: true
end
