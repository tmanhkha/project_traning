# frozen_string_literal: false

class Model < ApplicationRecord
  belongs_to :manufacturer

  has_many :data_memory_models, dependent: :destroy
  has_many :data_memories, through: :data_memory_models

  validates :name, presence: true, uniqueness: { case_sensitive: true }
end
