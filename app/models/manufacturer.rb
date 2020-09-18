# frozen_string_literal: false

# == Schema Information
#
# Table name: manufacturers
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_manufacturers_on_name  (name) UNIQUE
#
class Manufacturer < ApplicationRecord
  has_many :models, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 100 }

  accepts_nested_attributes_for :models, reject_if: :all_blank, allow_destroy: true
end
