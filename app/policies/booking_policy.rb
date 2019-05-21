class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user
  end

  def create?
    true
  end

  def edit?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
