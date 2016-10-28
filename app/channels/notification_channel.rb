# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationChannel < ApplicationCable::Channel
  def subscribed
    current_user.posts.each do |post|
      stream_from "new_post_channel_#{post.id}"
    end
  end

  def unsubscribed
  end
end
