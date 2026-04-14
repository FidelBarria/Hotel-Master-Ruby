class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin_or_supervisor

  def index
    authorize :users
    @users = current_user.hotel.user
  end

  def new
    authorize :users
    @user = User.new
  end

  def create
    authorize :users
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "Usuário criado com sucesso."
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :hotel_id, :username, :role)
  end

  def check_if_admin_or_supervisor
    unless current_user.role == "admin" || current_user.role == "supervisor"
      redirect_to root_path, alert: "Acesso não autorizado"
    end
  end
end
