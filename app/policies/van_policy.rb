class VanPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    creator? || admin?
  end

  def update?
    edit?
  end

  def destroy?
    creator? || admin?
  end
end
