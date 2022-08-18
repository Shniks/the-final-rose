class ContestantsController < ApplicationController

  def show
    @contestant = Contestant.find(params[:id])
    @bach = Bachelorette.find(@contestant[:bachelorette_id])
  end

end
