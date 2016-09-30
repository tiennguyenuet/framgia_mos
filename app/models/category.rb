class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :parent, class_name: Category.name
  has_many :childrens, class_name: Category.name, foreign_key: "parent_id",
    dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validate :not_delete, on: :destroy

  scope :parent_master, ->{where parent_id: nil}

  class << self
    def all_categories categories
      categories.map{|category| [category, Category.all_categories(category.childrens)]}
    end

    def all_categories_except category, categories
      categories.map do|c|
        [c, Category.all_categories_except(category, c.childrens)] if c != category
      end
    end
  end

  def level
    level = 0
    level = 1 + self.parent.level if self.parent
    level
  end

  private
  def not_delete
    if self.childrens.any? || self.posts.any?
      errors.add(:destroy, I18n.t(".not_delete"))
    end
  end
end
