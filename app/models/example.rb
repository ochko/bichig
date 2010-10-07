class Example < ActiveRecord::Base
  has_many :renderings, :class_name => RenderedExample.name
  belongs_to :category

  def category_name
    category.name
  end

  def category_name=(name)
    cat = name.match(/^[0-9]+$/) ? Category.find(name) : Category.find_by_name(name)
    cat = Category.create(:name => name) unless cat
    self.update_attribute(:category, cat)
  end
end
