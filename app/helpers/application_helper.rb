module ApplicationHelper
  def full_title page_title = ""
    base_title = "Melody of sound"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def index_for object, index, per_page
    (object.current_page - 1)* + per_page + index + 1
  end
end
