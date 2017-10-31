class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def index
    @message = Message.all
  end

  def create
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:text, :sender_id, :receipient_id, :user_id)
    end
end
