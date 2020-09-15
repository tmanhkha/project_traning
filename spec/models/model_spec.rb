# frozen_string_literal: false

require 'rails_helper'

RSpec.describe Model, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:manufacturer) }
    it { is_expected.to have_many(:data_memory_models).dependent(:destroy) }
    it { is_expected.to have_many(:data_memories).through(:data_memory_models) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    subject { create(:manufacturer) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
