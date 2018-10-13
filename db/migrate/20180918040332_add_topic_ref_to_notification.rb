class AddTopicRefToNotification < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :topic, foreign_key: true
  end
end
