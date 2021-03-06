# frozen_string_literal: false

require 'rails_helper'

describe GetDataMemoryModelService do
  describe 'execute' do
    let(:model) { create(:model) }
    let(:data_memory) { create(:data_memory) }

    it 'return empty array errors' do
      params = { model_id: model.id, data_memory_id: data_memory.id }
      data_memory_model = create(:data_memory_model, model_id: model.id, data_memory_id: data_memory.id)
      gdmm_service = described_class.new(params)
      gdmm_service.execute
      expect(gdmm_service.errors).to be_empty
      expect(gdmm_service.data_memory_model).to eq(data_memory_model)
    end

    it 'return array errors if params model_id empty' do
      params = { data_memory_id: data_memory.id }
      gdmm_service = described_class.new(params)
      gdmm_service.execute
      expect(gdmm_service.errors).to eq(["Model can't be blank"])
    end

    it 'return array errors if params data_memory_id empty' do
      params = { model_id: model.id }
      gdmm_service = described_class.new(params)
      gdmm_service.execute
      expect(gdmm_service.errors).to eq(["Data memory can't be blank"])
    end
  end
end
