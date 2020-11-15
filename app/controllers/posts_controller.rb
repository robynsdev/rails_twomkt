class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_cat, only: [:show]
  load_and_authorize_resource

  def index
    # @posts = Post.all
    if params[:query].present?
      @posts = Post.search(params[:query])
      @posts = Post.kinda_matching(params[:query])
      # @posts = Post.kinda_spelled_like(params[:query])
      # @posts = Post.sounds_like(params[:query])
    else
      @posts = Post.all
    end
  end

  def search
    query = params[:search]

    results = Post.where('name LIKE ?', "%#{query}%")
    if params[:filter] == 'Select Filter'
      @posts = results
    else
      symbol = params[:filter].gsub(/ /, '_').downcase!.to_sym
      @posts = results.where(symbol => true)
    end
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

    def set_cat
      @categories = Category.all
    end

    def post_params
      params.require(:post).permit(:title, :price, :description, :picture, :query, :commit, :sales, :delivery, category_ids: [] )
    end
end
