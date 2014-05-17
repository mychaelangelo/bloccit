class Post < ActiveRecord::Base
  # tells Rails that a post object can have many comments related to it
  # also provides methods that enable us to retrieve comments for a post
  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC') }
end
