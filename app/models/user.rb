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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_one :user_role, dependent: :destroy
  has_one :role, through: :user_role

  has_many :products, dependent: :destroy

  accepts_nested_attributes_for :user_role, allow_destroy: true

  def admin?
    role.present? && role.level == 1
  end

  def manager?
    role.present? && role.level == 2
  end

  def guest?
    role.present? && role.level == 3
  end
end
