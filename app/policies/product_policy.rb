# frozen_string_literal: false

class ProductPolicy < ApplicationPolicy
  attr_reader :user, :product
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, product)
    @user = user
    @product = product
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    admin_or_manager_allowed
  end

  def new?
    admin_or_manager_allowed
  end

  def update?
    admin_or_manager_allowed
  end

  def edit?
    admin_or_manager_allowed
  end

  def destroy?
    admin_or_manager_allowed
  end

  private

  def admin_or_manager_allowed
    @user.admin? || @user.manager?
  end
end