class User < ActiveRecord::Base
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
end
