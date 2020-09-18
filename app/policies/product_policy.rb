# frozen_string_literal: false

class ProductPolicy < ApplicationPolicy
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
    create?
  end

  def update?
    create?
  end

  def edit?
    create?
  end

  def destroy?
    create?
  end

  def models_of_manufacturer?
    create?
  end

  def data_memories_of_model?
    create?
  end

  private

  def admin_or_manager_allowed
    @user.admin? || @user.manager?
  end
end
