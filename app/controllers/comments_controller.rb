class CommentsController < ApplicationController
  before_action :if_not_logged_in, only: [:create, :new, :edit, :update]
  before_action :set_movie_if_nested, only: [:new, :index]

  def new
    if @movie
      @comment = @movie.comments.build
    else
      @comment = current_user.comments.build
    end
  end

  def create
    @comment = current_user.comments.build(comment_params)
    
    if @comment.save
      redirect_to comments_path
    else
      render 'comments/new'
    end
  end

  def index
    
    if @movie
      @comment = @movie.comment
    else
      @comment = Comment.all
    end
  end


  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def edit
    @comment = Comment.find_by_id(params[:id])
    redirect_to comments_path if @comment.user != current_user
  end

  def update
    @comment= Comment.find_by_id(params[:id])
    redirect_to comments_path if @comment.user != current_user
    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    else
      render 'comments/edit'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:movie_id)
  end

  def set_movie_if_nested
  @movie = Movie.find_by_id(params[:movie_id]) if params[:movie_id]
  end
end