class DataMemoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, data_memory)
    @user = user
    @data_memory = data_memory
  end

  def index?
    admin_or_manager_allowed
  end

  def show?
    admin_or_manager_allowed
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
