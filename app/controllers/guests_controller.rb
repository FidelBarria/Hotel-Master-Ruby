class GuestsController < ApplicationController
    before_action :authenticate_user!

  def index
    @guests = Guest.all
  end
  def new
    @hotel = Hotel.find(params[:hotel_id])
    @guest = Guest.new
  end
end
