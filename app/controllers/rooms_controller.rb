class RoomsController < ApplicationController
  def index
    @rooms = current_user.hotel.room
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to rooms_path, notice: "Quarto criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @room = current_user.hotel.room.find(params[:id])

    if @room.update(room_params_edit_housekeeping_status)
      flash.now[:notice] = "Quarto atualizado com sucesso!"
    else
      flash.now[:alert] = "Erro ao atualizar o quarto."
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to rooms_path, notice: "Quarto atualizado com sucesso!" }
    end
  end

  private

  def room_params
    params.require(:room).permit(:hotel_id, :description, :capacity, :price_per_night, :room_type,
     :room_number, :housekeeping_status, :occupancy_status)
  end

  def room_params_edit_housekeeping_status
  params.require(:room).permit(:housekeeping_status)
  end
end
