# frozen_string_literal: false

# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  level      :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:user_roles).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:user_roles) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:level) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
