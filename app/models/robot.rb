class Robot < ApplicationRecord
  has_many :weapons
  has_many :armors
end
