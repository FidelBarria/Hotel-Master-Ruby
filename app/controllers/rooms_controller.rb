class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize :room
    @rooms = current_user.hotel.room
    @rooms = @rooms.where(room_type: params[:room_type]) if params[:room_type].present?
    @rooms = @rooms.where(occupancy_status: params[:occupancy_status]) if params[:occupancy_status].present?
    @rooms = @rooms.where(housekeeping_status: params[:housekeeping_status]) if params[:housekeeping_status].present?
  end

  def new
    authorize :room
    @room = Room.new
  end

  def create
    authorize :room
    @room = Room.new(room_params)

    if @room.save
      redirect_to rooms_path, notice: "Quarto criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize :room
    @room = current_user.hotel.room.find(params[:id])
  end

  def update
    authorize :room
    @room = current_user.hotel.room.find(params[:id])

    if @room.update(room_params_edit_housekeeping_status)
      flash.now[:notice] = "Quarto atualizado com sucesso!"
      redirect_to rooms_path, notice: "Quarto atualizado com sucesso!"
    else
      flash.now[:alert] = "Erro ao atualizar o quarto."
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to rooms_path, notice: "Quarto atualizado com sucesso!" }
    end
  end

  def destroy
    authorize :room
    @room = current_user.hotel.room.find(params[:id])
    @room.destroy
    redirect_to rooms_path, notice: "Quarto excluído com sucesso!"
  end

  private

  def room_params
    params.require(:room).permit(:hotel_id, :description, :capacity, :price_per_night, :room_type,
     :room_number, :housekeeping_status, :occupancy_status)
  end

  def room_params_edit_housekeeping_status
  params.require(:room).permit(:housekeeping_status, :occupancy_status, :description, :capacity, :price_per_night, :room_type, :room_number)
  end
end
