class Review < ApplicationRecord
  belongs_to :topic, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :comment, presence: true
  after_create_commit :create_notification

  private

  def create_notification
    if self.review.user_id == self.user_id
      reviewer = User.find(self.review.user_id)
      Notification.create(content: "New message from #{reviewer.fullname}", user_id: self.reviewer.recipient_id)
    else
      sender = User.find(self.reviewer.recipient_id)
      Notification.create(content: "New message from #{sender.fullname}", user_id: self.conversation.sender_id)
    end
  end

end
