class UsersController < ApplicationController
  before_action :set_user, only: :show
  
  def show
    @message = Message.new
  end

  private

    def set_user
      @user = User.friendly.find(params[:id])
    end
end
