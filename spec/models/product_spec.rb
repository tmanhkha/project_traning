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
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:data_memory_model) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
  end

  describe 'methods' do
    let(:manufacturer) { create(:manufacturer, name: 'Apple') }
    let(:user) { create(:user) }
    let(:model) { create(:model, name: 'Iphone X', manufacturer_id: manufacturer.id) }
    let(:data_memory) { create(:data_memory, size: 64) }
    let(:data_memory_model) { create(:data_memory_model, model_id: model.id, data_memory_id: data_memory.id) }
    let(:product) { create(:product, data_memory_model: data_memory_model, user: user) }

    it 'manufacture_of_product' do
      expect(product.manufacture_of_product).to eq('Apple')
    end

    it 'model_of_product' do
      expect(product.model_of_product).to eq('Iphone X')
    end

    it 'data_memory_of_product' do
      expect(product.data_memory_of_product).to eq('64 G')
    end
  end
end
