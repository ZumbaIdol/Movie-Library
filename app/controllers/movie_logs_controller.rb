class MovieLogsController < ApplicationController
  before_action :if_not_logged_in, only: [:create, :new, :edit, :update]
  before_action :set_movie_if_nested, only: [:new, :index]

  def new
    if @movie
      #nested
      @movie_logs = current_user.movie_logs.build
      @movie_logs.movie_id = @movie.id
    else
      #not nested
      @movie_logs = current_user.movie_logs.build
    end
  end

  def create    
    @movie_log = current_user.movie_logs.build(comment_params)
    
    if @movie_log.save
      redirect_to movie_logs_path
    else
      render 'movie_logs/new'
    end
  end

  def index
    if @movie
      @movie_logs = @movie.comment
    else
      @movie_logs = MovieLog.all
    end
  end


  def show
    @comment = MovieLog.find_by(params[:id])
  end

  def edit
    @comment = MovieLog.find_by(params[:id])
    redirect_to movie_logs_path if @comment.user != current_user
  end

  def update
    @comment = MovieLog.find_by(params[:id])
    redirect_to movie_logs_path if @comment.user != current_user
    if @comment.update(comment_params)
      redirect_to movie_log_path(@comment)
    else
      render 'movie_logs/edit'
    end
  end

  private

  def comment_params
    params.require(:movie_log).permit(:movie_id, :user_id, :comment)
  end

  def set_movie_if_nested
  @movie = Movie.find_by_id(params[:movie_id]) if params[:movie_id]
  end
end