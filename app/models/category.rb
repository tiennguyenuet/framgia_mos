class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :parent, class_name: Category.name
  has_many :children, class_name: Category.name, foreign_key: "parent_id",
    dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :parent_master, ->{where parent_id: nil}
end
