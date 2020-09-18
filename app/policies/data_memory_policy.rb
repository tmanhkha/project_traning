# frozen_string_literal: false

class DataMemoryPolicy < ApplicationPolicy
  def initialize(user, data_memory)
    @user = user
    @data_memory = data_memory
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
