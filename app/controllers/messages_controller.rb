class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @message = Message.new
  end

  def index
    @message = Message.all
  end

  def create
    @sender = current_user
    @receipient = User.friendly.find(params[:user_id])
    
    @message = @sender.messages.new(message_params)

    if @message.save
      flash[:success] = "Message has been sent."
      redirect_to current_user
    else
      flash[:danger] = "Error occured while sending the message."
    end
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:text, :sender_id, :receipient_id, :user_id)
    end
end
