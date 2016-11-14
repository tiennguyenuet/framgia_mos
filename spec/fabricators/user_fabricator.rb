Fabricator(:user) do
  name {sequence(:name) {|i| "User#{i+1}"}}
  email {sequence(:email) {|i| "email#{i+1}@framgia.com"}}
  user_name {sequence(:user_name) {|i| "account#{i+1}" }}
  password "12345678"
  password_confirmation "12345678"
  role 1
end
