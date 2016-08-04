class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy


  def new
    if logged_in?
      @review  = current_user.reviews.build
      @productId = params[:productId]
    end
  end


  def create

    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = "Review created!"
      # redirect_to :back
      redirect_to product_url(@review.product_id)
    else
      @feed_items = []
      # redirect_to products_url
      # render 'static_pages/home'
      render 'new'
    end
  end

  def destroy
    @review.destroy
   flash[:success] = "Review deleted"
   redirect_to request.referrer || root_url
  end

  private

    def review_params
      params.require(:review).permit(:content, :user_id, :product_id)
    end

    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to root_url if @review.nil?
    end

    # Confirms an admin user.
        def admin_user
          redirect_to(root_url) unless current_user.admin?
        end
end
