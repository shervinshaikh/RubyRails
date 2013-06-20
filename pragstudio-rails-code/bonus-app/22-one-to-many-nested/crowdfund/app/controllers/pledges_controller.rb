class PledgesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @pledges = @project.pledges
  end
end
