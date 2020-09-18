# frozen_string_literal: false

# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  level      :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  validates :level, presence: true
  validates :name, presence: true
end
