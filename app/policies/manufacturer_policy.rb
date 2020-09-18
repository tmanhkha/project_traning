# frozen_string_literal: false

class ManufacturerPolicy < ApplicationPolicy
  def initialize(user, manufacturer)
    @user = user
    @manufacturer = manufacturer
  end

  def index?
    admin_or_manager_allowed
  end

  def show?
    index?
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

  def admin_or_manager_allowed
    @user.admin? || @user.manager?
  end
end
