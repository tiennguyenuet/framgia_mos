module ApplicationHelper
  def full_title page_title = ""
    base_title = "Melody of sound"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def index_for object, index, per_page
    (object.current_page - 1)* + per_page + index + 1
  end

  def vertical_display_post index
    (index / 2) % 2 == 0
  end

  def resource_name
    :user
  end

  def resource_class
     User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
