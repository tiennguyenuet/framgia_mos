Fabricator(:category) do
  name {sequence(:name) {|i| "Category#{i}"}}
  description "description"
end
