class StaticPagesController < ApplicationController
  def home
    @first_post = Post.accepted.order(created_at: :desc).first
  end
end
