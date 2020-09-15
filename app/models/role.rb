# frozen_string_literal: false

class Role < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  validates :level, presence: true
  validates :name, presence: true
end
