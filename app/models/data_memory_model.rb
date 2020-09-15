class DataMemoryModel < ApplicationRecord
  belongs_to :data_memory
  belongs_to :model

  has_many :products
end
