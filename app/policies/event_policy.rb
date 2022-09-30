class EventPolicy < ApplicationPolicy
  def update?
    user_is_owner?
  end

  def show?
    return false unless @user.user.present?

    return true if @record.pincode.blank? || user_is_owner?

    return true if @user.pincode.present? && @record.pincode_valid?(@user.pincode)

    @record.pincode_valid?(@user.cookies["events_#{@record.id}_pincode"])
  end

  def destroy?
    user_is_owner?
  end

  class Scope < Scope
    def resolve
      if @user.user.present?
        scope.includes(:user, :subscriptions)
             .where(subscriptions: { user: @user.user })
             .or(scope.where(user: @user.user))
      end
    end
  end

  private
  
  def user_is_owner?
    @record.user == @user.user
  end
end
