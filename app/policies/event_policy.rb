class EventPolicy < ApplicationPolicy
  def update?
    user_is_owner?
  end

  def show?
    user.present?
  end

  def destroy?
    user_is_owner?
  end

  class Scope < Scope
    def resolve
      if user.present?
        scope.includes(:user, :subscriptions)
             .where(subscriptions: { user: user })
             .or(scope.where(user: user))
      end
    end
  end

  private
  
  def user_is_owner?
    record.user == user
  end
end
