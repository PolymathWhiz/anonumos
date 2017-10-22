class User < ApplicationRecord
  # before_create :validate_username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }, presence: true, 
                       uniqueness: { case_sensitive: false }
                       
  validates :name, presence: true
  
  # def validate_username
  #   self.username = username.downcase unless username.blank?
  # end
end
