class Message < ApplicationRecord
  belongs_to :user

  validates_presence_of :sender_id, :recipient_id, :user_id, :text

  # TODO: validate text
end
