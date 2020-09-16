# frozen_string_literal: false

class DataMemoryModel < ApplicationRecord
  belongs_to :data_memory
  belongs_to :model

  has_many :products, dependent: :destroy
end
