class OffersController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @offer = @post.offers.new(offer_params)
    @offer.commenter = current_user.id if current_user
    # @offer = @post.offers.create(offer_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def accept
    @post = Post.find(params[:post_id])
    @offer = @post.offers.find(params[:id])
    @offer.accept = true
    Transaction.create!(seller_id: @offer.commenter, buyer_id: current_user.id, post_id: @post.id)
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
