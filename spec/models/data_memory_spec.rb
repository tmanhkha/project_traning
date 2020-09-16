# frozen_string_literal: false

require 'rails_helper'

RSpec.describe DataMemory, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:data_memory_models).dependent(:destroy) }
    it { is_expected.to have_many(:models).through(:data_memory_models) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
