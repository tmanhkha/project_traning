# frozen_string_literal: false

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:user_role).dependent(:destroy) }
    it { is_expected.to have_one(:role).through(:user_role) }
  end

  describe 'methods' do
    it 'is admin' do
      user = create(:user)
      role = Role.create(name: 'Admin', level: 1)
      user.create_user_role!(role: role)
      expect(user.admin?).to eq(true)
    end

    it 'is manager' do
      user = create(:user)
      role = Role.create(name: 'Manager', level: 2)
      user.create_user_role!(role: role)
      expect(user.manager?).to eq(true)
    end

    it 'is guest' do
      user = create(:user)
      role = Role.create(name: 'Guest', level: 3)
      user.create_user_role!(role: role)
      expect(user.guest?).to eq(true)
    end
  end
end
