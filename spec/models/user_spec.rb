# frozen_string_literal: false

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
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
