class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validate :not_delete, on: :destroy

  acts_as_nested_set ({counter_cache: :children_count})

  class << self
    def all_categories categories
      categories.map{|category| [category, Category.all_categories(category.children)]}
    end

    def all_categories_except category, categories
      categories.map do|c|
        [c, Category.all_categories_except(category, c.children)] if c != category
      end
    end
  end

  private
  def not_delete
    if self.children_count > 0 || self.posts.any?
      self.errors.add(:destroy, I18n.t(".not_delete"))
    end
  end
end
