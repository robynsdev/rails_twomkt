class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_cat, only: [:show]
  load_and_authorize_resource

  def index
    # search bar and category filter
    if params[:query].present? && params[:cat].present?
      found_posts = Post.search(params[:query])
      @posts = found_posts.select { |post| p post.category_ids.select { |id| id == params[:cat].to_i }.any? }

    elsif params[:query].present? && params[:cat].blank?
      @posts = Post.search(params[:query])

    elsif params[:query].blank? && params[:cat].present?
      @posts = Post.all.select { |post| p post.category_ids.select { |id| id == params[:cat].to_i }.any? }

    else
      @posts = Post.all.order(created_at: :desc)
    end 

    # pagination - kaminari
    @posts = Kaminari.paginate_array(@posts).page(params[:page])
  end

  
  def show
    @name = User.find(@post.user_id).name
    @email = User.find(@post.user_id).email
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
      params.require(:post).permit(:title, :price, :description, :picture, :query, :cat, :commit, :sales, :delivery, category_ids: [] )
    end
end
