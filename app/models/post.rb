class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  enum status: [:waiting, :accepted, :reject]
end
