class BacheloretteContestantsController < ApplicationController

  def index
    @bach = Bachelorette.find(params[:id])
    @contestants = @bach.contestants
  end

end
