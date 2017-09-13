class RentPolicy < ApplicationPolicy
  def index?
    record.first.user_id == user.id
  end

  def create?
    user.id == record.user_id
  end
end
