# frozen_string_literal: false

class DataMemory < ApplicationRecord
  has_many :data_memory_models, dependent: :destroy
  has_many :models, through: :data_memory_models

  validates :name, presence: true, uniqueness: { case_sensitive: true }
end
