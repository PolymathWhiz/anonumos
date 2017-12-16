class FavouritesController < ApplicationController
  before_action :authenicate_user!
  
  def create
    @favourite = current_user.favourites.new(favourite_params)
    @favourite.message_id = params[:message_id]

    if @favourite.save
      flash[:success] = "Message was favourited"
    else
      flash[:danger] = "Could not favourite message"
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
  end

  private

    def favourites_params
      params.require(:favourites).permit(:message_id)
    end
end
