class FilmsController < ApplicationController
  # disable token for external testing
  protect_from_forgery with: :null_session

  before_action :set_film, only: %i[show update destroy]

  def index
    @films = Film.all
    render json: @films
  end

  def show
    render json: @film
  end

  def create
    @film = Film.new(film_params)

    if @film.save
      render json: @film, status: :created
    else
      render json: @film.errors, status: :unprocessable_entity
    end
  end

  def update
    if @film.update(film_params)
      render json: @film
    else
      render json: @film.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @film.destroy
  end

  private

  def set_film
    @film = Film.find(params[:id])
  end

  def film_params
    params.require(:film).permit(:title, :description, :release_date, :rating)
  end
end
