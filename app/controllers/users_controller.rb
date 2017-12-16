class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def show
    @message = Message.new
    if !current_user.nil?
      @sent = Message.where(sender_id: current_user.id).order("CREATED_AT DESC")
      @received = Message.where(recipient_id: current_user.id).order("CREATED_AT DESC")       
    end
  end

  private

    def set_user
      @user = User.friendly.find(params[:id])
    end

end
