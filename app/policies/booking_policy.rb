class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # if user.admin?
      #   scope.all
      # else
      #   scope.where(user_id: user.id)
      # end
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
