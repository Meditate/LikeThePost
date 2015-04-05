class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :delete, :destroy]
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show

  end

  def update
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def edit
  end

  private

  def posts_params
    params.require(:post).permit(:description)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
