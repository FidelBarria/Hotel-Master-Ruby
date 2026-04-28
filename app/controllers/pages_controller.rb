class PagesController < ApplicationController
  def reception
    @hotel = Hotel.find(current_user.hotel_id)
  end
end
