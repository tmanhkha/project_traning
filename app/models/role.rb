class Role < ApplicationRecord
  validates :name, :level, presence: true, uniqueness: true
end
