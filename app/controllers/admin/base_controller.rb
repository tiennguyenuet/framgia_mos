class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :load_categories_parent_master

  private
  def load_categories_parent_master
    @categories_parent_master = Category.parent_master
  end
end
