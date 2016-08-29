class FilmsController < ApplicationController
  def index
  end


  def get_films
    films = Film.all.to_json
    render json: films
  end
end
