class UsersController < ApplicationController
  
  def index
    @users = User.all
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
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :company, :password, tag_ids: [])
  end
end
