class Product < ApplicationRecord
  belongs_to :user
  belongs_to :data_memory_model
end
