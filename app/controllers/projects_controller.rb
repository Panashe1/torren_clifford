class ProjectsController < ApplicationController
  def index
    @projects = Project.where(category: "architecture").order(:position)
  end

  def show
    @project = Project.find(params[:id])
    @images = @project.gallery
  end
end
