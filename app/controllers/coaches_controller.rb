class CoachesController < ApplicationController
  def index
    @coaches = Coach.all
  end

  def search
    @coaches = Coach.search(params[:name])
  end

end