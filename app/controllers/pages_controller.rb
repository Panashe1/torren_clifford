class PagesController < ApplicationController
  def home
    @hero_project = Project.where(featured: true).order(:position).first
    @projects = Project.where(category: "architecture").order(:position)
  end

  def about; end

  def contact; end

  def travel
    @category = params[:category].titleize
    @projects = Project.where(category: params[:category]).order(:position)
  end
end
