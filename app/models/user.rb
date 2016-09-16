class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_ralationships, class_name: Relationship.name,
    foreign_key: :following_id, dependent: :destroy
  has_many :followers, through: :active_relationships, source: :following
  has_many :following, through: :passive_relationships, source: :follower
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true, length: {maximum: 50}
  enum role: [:admin, :user]
  enum status: [:active, :blocked]
end
