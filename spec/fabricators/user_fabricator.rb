Fabricator(:user) do
  name {sequence(:name) {|i| "User#{i}"}}
  email {sequence(:email) {|i| "email#{i}@gmail.com"}}
  user_name {sequence(:user_name) {|i| "account#{i}" }}
  password "12345678"
  password_confirmation "12345678"
  role 1
end
