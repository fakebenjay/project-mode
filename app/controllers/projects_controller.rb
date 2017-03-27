class ProjectsController < ApplicationController
  def index
    if params[:category_id]
      redirect_to category_path(params[:category_id])
    else
      @projects = Project.all
    end
  end

  def new
    @category = Category.find(params[:category_id])
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to category_projects_path(@project.category_id)
    else
      flash[:notice] = "UH OH!!!"
      @category = Category.find(params[:category_id])
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)

    if @project.save
      redirect_to category_projects_path(@project.category_id)
    else
      flash[:notice] = "UH OH!!!"
      @category = Category.find(params[:category_id])
      render :new
    end
  end

  private

    def project_params
      params.require(:project).permit(:name, :description, :category_id)
    end
end
