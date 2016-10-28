class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform post
    ActionCable.server.broadcast "new_post_channel_#{post.id}", post: post
  end
end
