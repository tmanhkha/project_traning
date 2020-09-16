# frozen_string_literal: false

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
    let(:data_memory) { create(:data_memory, name: 64) }
    let(:data_memory_model) { create(:data_memory_model, model_id: model.id, data_memory_id: data_memory.id) }
    let(:product) { create(:product, data_memory_model: data_memory_model, user: user) }

    it 'manufacture_of_product' do
      expect(product.manufacture_of_product).to eq('Apple')
    end

    it 'model_of_product' do
      expect(product.model_of_product).to eq('Iphone X')
    end

    it 'data_memory_of_product' do
      expect(product.data_memory_of_product).to eq(64)
    end
  end
end
