# frozen_string_literal: false

require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:models).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'accepts_nested_attributes' do
    it { is_expected.to accept_nested_attributes_for(:models) }
  end
end
