class Post < ActiveRecord::Base
  # tells Rails that a post object can have many comments related to it
  # also provides methods that enable us to retrieve comments for a post
  has_many :comments, dependent: :destroy
  mount_uploader :postimage, PostImageUploader
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true 

end
