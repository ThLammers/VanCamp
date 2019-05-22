class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    creator? || admin?
  end

  def create?
    true
  end

  def edit?
    creator? || admin?
  end

  def destroy?
    creator? || admin?
  end
end
