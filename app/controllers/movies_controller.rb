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
    @most_popular = Movie.most_comments.first
    @movies = Movie.all
  end

  def show
    @movie = Movie.find_by_id(params[:id])
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :category, :rating)
  end
end