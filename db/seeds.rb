# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
environment_seed_file = File.join(Rails.root, 'db', 'seeds', "#{Rails.env}.rb")

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/#{file_name}.jpg"))
end

(1..10).each do |id|
  User.create(name: "User #{id}",
    user_name: "user#{id}",
    password: "123456",
    email: "user#{id}@example.com")
end

User.create(name: "admin",
  user_name: "admin",
  password: "123456",
  email: "admin@example.com",
  role: 0)

4.times do |n|
  category = Category.create name: "Category #{n+1}", description: "abc"
  3.times do |m|
    c2 = Category.create name: "Category #{n+1} #{m+1}", description: "abc", parent_id: category.id
    Category.create name: "Category #{n+1} #{m+1} 1", description: "abc", parent_id: c2.id
    Category.create name: "Category #{n+1} #{m+1} 2", description: "abc", parent_id: c2.id
  end
end

Category.create!(name: "Tam su",
  description: "Noi nhung loi yeu thuong",
  parent_id: nil)
Category.create!(name: "Tin tuc",
  description: "Cap nhat tin tuc doi song",
  parent_id: nil)

(1..20).each do |id|
  Advertisment.create(description: "Description #{id}",
    url: "url #{id}",
    image: "xe_dap")
end


