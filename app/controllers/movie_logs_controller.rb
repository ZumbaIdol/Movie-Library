class MovieLogsController < ApplicationController
  before_action :if_not_logged_in, only: [:create, :new, :edit, :update]
  before_action :set_movie_if_nested, only: [:new, :index]
  before_action :comment, only: [:show, :edit, :update]

  def new
    @most_popular = Movie.most_comments.first
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
    @movie_logs = current_user.movie_logs.build(comment_params)
    if @movie_logs.save
      redirect_to movie_logs_path
    else
      render 'movie_logs/new'
    end
  end

  def index
    @most_popular = Movie.most_comments.first
    if @movie
      @movie_logs = @movie.comment
    else
      @movie_logs = MovieLog.all
    end
  end


  def show
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      redirect_to movie_log_path(@comment)
    else
      render 'movie_logs/edit'
    end
  end

  def destroy
    MovieLog.find(params[:id]).destroy
    flash[:notice] = "Comment was successfully deleted!"
    redirect_to movies_path(current_user)
  end


  private

  def comment_params
    params.require(:movie_log).permit(:movie_id, :user_id, :comments)
  end

  def set_movie_if_nested
    @movie = Movie.find_by_id(params[:movie_id]) if params[:movie_id]
  end

  def comment
    @comment = MovieLog.find_by_id(params[:id])
  end
end


