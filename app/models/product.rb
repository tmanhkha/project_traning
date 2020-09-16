# frozen_string_literal: false

class Product < ApplicationRecord
  belongs_to :user
  belongs_to :data_memory_model

  validates :price, presence: true, numericality: { greater_than: 0 }

  def manufacture_of_product
    data_memory_model&.model&.manufacturer&.name
  end

  def model_of_product
    data_memory_model&.model&.name
  end

  def data_memory_of_product
    data_memory_model&.data_memory&.name
  end
end
