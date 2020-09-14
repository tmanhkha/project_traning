class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.except(:role_id))

    respond_to do |format|
      if @user.save
        create_user_roles
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def create_user_roles
    @user.create_user_role(role_id: user_params[:role_id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
  end
end
