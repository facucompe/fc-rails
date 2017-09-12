class RentPolicy < ApplicationPolicy
  def index?
    record.all? { |rent| rent.user_id == user.id }
  end

  def create?
    user.id == record.user_id
  end
end
