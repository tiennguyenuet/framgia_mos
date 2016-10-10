class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :load_category_roots

  private
  def load_category_roots
    @category_roots = Category.roots
  end
end
