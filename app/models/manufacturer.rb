# frozen_string_literal: false

class Manufacturer < ApplicationRecord
  has_many :models, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: true }

  accepts_nested_attributes_for :models, reject_if: :all_blank, allow_destroy: true
end
