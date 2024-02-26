class SourcesController < ApplicationController
  # disable token for external testing
  protect_from_forgery with: :null_session

  before_action :set_source, only: %i[show update destroy]

  def index
    @sources = Source.all
    render json: @sources
  end

  def show
    render json: @source
  end

  def create
    @source = Source.new(source_params)

    if @source.save
      render json: @source, status: :created
    else
      render json: @source.errors, status: :unprocessable_entity
    end
  end

  def update
    if @source.update(source_params)
      render json: @source
    else
      render json: @source.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @source.destroy
  end

  private

  def set_source
    @source = Source.find(params[:id])
  end

  def source_params
    params.require(:source).permit(:name, :description, :url)
  end
end
