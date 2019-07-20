class PostsController < ApplicationController
  before_action :load_object, only: [:edit, :destroy, :update]
  def index
    @posts = Post.all
    @posts_count = Post.all.count
  end

  def new
    @post = Post.new
  end

  #def show
  #  @post = Post.where(id: params [:id]).first
  #end

  def edit
  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post)
  end

  def update
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end

  def load_object
    @post = Post.where(id: params[:id]).first
  end
end
