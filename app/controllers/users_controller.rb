class UsersController < ApplicationController
  before_action :set_q, only: [:index, :search]
  
  def index
    @users = params[:tag_id].present? ? Tag.find(params[:tag_id]).users : User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "更新しました"
      redirect_to users_path
    else
      render "show"
    end
  end
  
  def search
    @results = @q.result
  end
  
  private
  
  def set_q
    @q = User.ransack(params[:q])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :company, :password, tag_ids: [])
  end
end
