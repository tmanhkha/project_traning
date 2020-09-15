class ModelPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, model)
    @user = user
    @model = model
  end

  def index?
    admin_or_manager_allowed
  end

  def show?
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
