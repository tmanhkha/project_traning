# frozen_string_literal: false

class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
end
