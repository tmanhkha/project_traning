# frozen_string_literal: false

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, account)
    @user = user
    @account = account
  end

  def index?
    only_admin_allowed
  end

  def create?
    only_admin_allowed
  end

  def new?
    only_admin_allowed
  end

  def update?
    only_admin_allowed
  end

  def edit?
    only_admin_allowed
  end

  def destroy?
    only_admin_allowed
  end

  private

  def only_admin_allowed
    @user.admin?
  end
end
