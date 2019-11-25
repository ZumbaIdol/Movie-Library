class Movie < ApplicationController

  def index
    @movies = Movie.all
  end
end