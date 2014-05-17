class TopicPolicy < ApplicationPolicy

  def index?
    true
  end

  # only admins can create topics
  def create?
    user.present? && user.role?(:admin)
  end

  # only admins can update topics
  def update?
    create?
  end

end