class OffersController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @offer = @post.offers.new(offer_params)
    @offer.commenter = current_user.name if current_user
    @offer.save
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @offer = @post.offers.find(params[:id])
    @offer.destroy
    redirect_to post_path(@post)
  end
 
 
  private
    def offer_params
      params.require(:offer).permit(:amount)
    end
end