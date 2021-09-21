class ProjectsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @project = current_user.projects.new
  end
  
  def create
    @project = current_user.projects.new(project_params)
    
    if @project.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to user_path(current_user.id)
  end

  private
  
  def project_params
    params.require(:project).permit(:name, :caption, :start_date, :end_date)
  end
end
