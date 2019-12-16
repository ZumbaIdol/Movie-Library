class MoviesController < ApplicationController
  before_action :if_not_logged_in, only: [:create, :new]

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render '/movies/new'
    end
  end

  def index
    if params[:movie_id]
      @movies = Movie.where(movie_id: params[:movie_id])
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find_by(params[:id])
  end

  private

  def movie_params
    params.require(:movie).permit(:title)
  end
end