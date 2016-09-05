class FilmsController < ApplicationController

  def index
  end

  def show
    @film_id = params[:id]
  end

end
