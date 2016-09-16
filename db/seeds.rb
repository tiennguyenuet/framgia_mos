4.times do |n|
  category = Category.create name: "Category #{n+1}", description: "abc"
  3.times do |m|
    Category.create name: "Category #{n+1} #{m+1}", description: "abc", parent_id: category.id
  end
end
