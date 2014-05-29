class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  # so that comments are displayed from latest to the oldest
  default_scope { order('created_at DESC') }

  # comment must have some text (i.e. body) and min length of 5 chars
  # comment must have associated post
  # comment must have associated user
  validates :body, length: { minimum: 5 }, presence: true
  validates :post, presence: true
  validates :user, presence: true

end
