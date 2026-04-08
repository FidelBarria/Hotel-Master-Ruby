class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to new_user_registration_path(hotel_id: @hotel.id), notice: "Hotel created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def hotel_params
    params.require(:hotel).permit(:name, :address, :city, :phone, :email, :category, :state, :number_of_rooms)
  end
end
