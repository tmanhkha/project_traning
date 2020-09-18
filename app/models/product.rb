# frozen_string_literal: false

# == Schema Information
#
# Table name: products
#
#  id                   :bigint           not null, primary key
#  price                :decimal(10, )
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  data_memory_model_id :bigint           not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_products_on_data_memory_model_id  (data_memory_model_id)
#  index_products_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (data_memory_model_id => data_memory_models.id)
#  fk_rails_...  (user_id => users.id)
#
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
    "#{data_memory_model&.data_memory&.size} G"
  end
end
