class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    # search bar (:query) and category filter (:cat)
    # .search searches through title and description of each post (pg_search gem)
    # posts and categories have a many to many relationship
    # if :cat present, loop through posts from search/all posts and loop through each post's categories, checking if id matches :cat
    if params[:query].present? && params[:cat].present?
      found_posts = Post.search(params[:query])
      @posts = found_posts.select { |post| p post.category_ids.select { |id| id == params[:cat].to_i }.any? }

    elsif params[:query].present? && params[:cat].blank?
      @posts = Post.search(params[:query])

    elsif params[:query].blank? && params[:cat].present?
      @posts = Post.all.select { |post| p post.category_ids.select { |id| id == params[:cat].to_i }.any? }

    else
      @posts = Post.all
    end 

    # sort posts by newest to oldest
    @posts = @posts.sort_by { |post| post.created_at }.reverse!
    # pagination - kaminari
    @posts = Kaminari.paginate_array(@posts).page(params[:page])
  end

  
  def show
    # used by view to find category names
    # returns all rows in Category
    @categories = Category.all
    # for mail_to
    # 
    @name = User.find(@post.user_id).name
    @email = User.find(@post.user_id).email
  end

  def new
    # creates a new post in Post
    @post = Post.new
  end  

  def edit
  end

  def create
    # saves params and current_user.id in Post.new
    @post = Post.new(post_params)
    @post.user_id = current_user.id if current_user
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update   
    # saves entered params in selected post, overwriting previous value
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    # deletes selected post
    @post.destroy
   
    redirect_to posts_path
  end

  def restricted
  end
   
  private
    # finds a selected post
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      # permitted parameters
      params.require(:post).permit(:title, :price, :description, :picture, :query, :cat, :commit, :sales, :delivery, :state, :suburb, category_ids: [] )
    end
end
