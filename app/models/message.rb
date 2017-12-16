class Message < ApplicationRecord
  belongs_to :user

  has_many :favourites

  validates_presence_of :sender_id, :recipient_id, :user_id, :text

  validates :text, length: { maximum: 120  }
end
