# frozen_string_literal: false

class ModelPolicy < ApplicationPolicy
  def initialize(user, model)
    @user = user
    @model = model
  end

  def index?
    admin_or_manager_allowed
  end

  def show?
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
