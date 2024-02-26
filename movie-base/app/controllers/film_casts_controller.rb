class FilmCastsController < ApplicationController
  def index
    @film = Film.find(params[:film_id])
    @actors = @film.actors
    render json: @actors
  end
end
