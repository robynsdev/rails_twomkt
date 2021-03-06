class HomeController < ApplicationController
  def index
  end

  def ad_listing
    @posts = User.find(current_user.id).posts
    @num = @posts.length
    
    if @num != nil
      # sort posts by newest to oldest
      @posts = @posts.sort_by { |post| post.created_at }.reverse!
      # pagination - kaminari
      @posts = Kaminari.paginate_array(@posts).page(params[:page])
    end
  end
end
