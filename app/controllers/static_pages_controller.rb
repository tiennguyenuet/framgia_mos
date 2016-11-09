class StaticPagesController < ApplicationController
  def home
    @first_post = Post.accepted.last
    @hot_posts = Post.accepted.order(created_at: :desc)
    .limit Settings.static_pages.number_hot_posts
  end
end
