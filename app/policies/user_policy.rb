# frozen_string_literal: false

class UserPolicy < ApplicationPolicy
  def initialize(user, account)
    @user = user
    @account = account
  end

  def index?
    only_admin_allowed
  end

  def create?
    index?
  end

  def new?
    index?
  end

  def update?
    index?
  end

  def edit?
    index?
  end

  def destroy?
    index?
  end

  private

  def only_admin_allowed
    @user.admin?
  end
end
