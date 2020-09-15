# frozen_string_literal: false

require 'rails_helper'

RSpec.describe UserRole, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:role) }
  end
end
