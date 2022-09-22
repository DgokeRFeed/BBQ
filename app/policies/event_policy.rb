class EventPolicy < ApplicationPolicy
  def update?
    user_is_owner?(record)
  end

  def show?
    user.present?
  end

  def destroy?
    user_is_owner?(record)
  end

  class Scope < Scope
    def resolve
      if user.present?
        scope.joins(:subscriptions).where(subscriptions: { user_id: user }) + scope.where(user: user)
      end
    end
  end

  private

  def user_is_owner?(event)
    user.present? && (event.user == user)
  end
end
