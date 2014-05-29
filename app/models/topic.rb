class Topic < ActiveRecord::Base
  # adding the 'dependent: :destroy' means when topic is deleted, associated posts are deleted too
  has_many :posts, dependent: :destroy
end
