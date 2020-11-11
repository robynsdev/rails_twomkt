class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @posts = Post.all
  end
  
  def show
  end

  def new
    @post = Post.new
  end  

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if current_user
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update   
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
   
    redirect_to posts_path
  end

  def restricted
  end
   
  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :price, :description, :picture, category_ids: [] )
    end
end
