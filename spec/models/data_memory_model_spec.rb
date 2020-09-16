# frozen_string_literal: false

require 'rails_helper'

RSpec.describe DataMemoryModel, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:data_memory) }
    it { is_expected.to belong_to(:model) }
  end
end
