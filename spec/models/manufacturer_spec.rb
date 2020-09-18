# frozen_string_literal: false

# == Schema Information
#
# Table name: manufacturers
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_manufacturers_on_name  (name) UNIQUE
#
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
