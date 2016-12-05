class StaticPagesController < ApplicationController
  def home
    @first_post = Post.accepted.order(created_at: :desc).first
    @recent_posts = Post.accepted.order(created_at: :desc).drop(1)
      .take Settings.static_pages.number_hot_posts
    @favourite_posts = Post.order(likes_count: :desc)
      .limit Settings.static_pages.home.favourite_posts_size
  end
end
