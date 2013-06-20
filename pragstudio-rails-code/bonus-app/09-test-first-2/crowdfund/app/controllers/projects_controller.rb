class ProjectsController < ApplicationController
  def index
    @projects = ["Project A", "Project B", "Project C"]
  end
end
