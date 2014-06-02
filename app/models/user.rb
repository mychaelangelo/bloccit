class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :votes, dependent: :destroy
  has_many :posts
  has_many :comments
  has_many :favorites, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  # takes 'post' object and returns a 'favorite' object if the 'post' arg has associated record
  # in the 'favorties' table
  def favorited(post)
    self.favorites.where(post_id: post.id).first
  end

  def role?(base_role)
    role == base_role.to_s
  end

end
