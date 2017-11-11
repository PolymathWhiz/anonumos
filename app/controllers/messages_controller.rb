class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:destroy_sent, :destroy_received]
  def index
    @message = Message.all #user specific email
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.sender_id = current_user.id
    
    if @message.save
      flash[:success] = "Message has been sent."
      # redirect_to user_path(current_user)
      redirect_to success_path
    else
      flash[:danger] = "Error occured while sending the message."
    end
  end

  def destroy_sent
    if @message.toggle(:sender_deleted)
      flash[:success] = "Message Deleted."
      redirect_back fallback_location: current_user      
    else
      flash[:danger] = "Unable to delete message."
    end
  end

  def destroy_received
    if @message.toggle(:recipient_deleted)
      flash[:success] = "Message Deleted."
      redirect_back fallback_location: current_user      
    else
      flash[:danger] = "Unable to delete message."
    end
  end

  def success
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:text, :sender_id, :recipient_id, :user_id)
    end
end
