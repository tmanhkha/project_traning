# frozen_string_literal: false

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_one :user_role, dependent: :destroy
  has_one :role, through: :user_role

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
