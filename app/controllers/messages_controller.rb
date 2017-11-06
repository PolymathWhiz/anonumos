class MessagesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_user, only: [:create]

  def index
    @message = Message.all #user specific email
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.sender_id = current_user.id

    if @message.save
      flash[:success] = "Message has been sent."
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Error occured while sending the message."
      # redirect_to user_path 
    end
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:text, :sender_id, :recipient_id, :user_id)
    end
end
