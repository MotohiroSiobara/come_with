class UsersController < ApplicationController
  before_action :set_user, only: [:show, :create, :update, :edit]
  before_action :authenticate


  def index
  end

  def show
    @holding = current_user.holding_events
    @joining = current_user.join_events
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile, :icon, :email)
  end
end
