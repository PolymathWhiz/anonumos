class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def show
    @message = Message.new
    @sent = Message.where(sender_id: current_user.id)
    @received = Message.where(recipient_id: current_user.id)
  end

  private

    def set_user
      @user = User.friendly.find(params[:id])
    end

end
