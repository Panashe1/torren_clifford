class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :load_nav_projects

  private

  def load_nav_projects
    @nav_projects = Project.where(category: "architecture").order(:position)
  end
end
