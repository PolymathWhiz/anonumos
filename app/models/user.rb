class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }, presence: true, 
                       uniqueness: { case_sensitive: false }
                       
  validates :name, presence: true

  has_many :messages

end
