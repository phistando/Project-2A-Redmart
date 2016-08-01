class StaticPagesController < ApplicationController
  def home
    if logged_in?
     @review  = current_user.reviews.build
     @feed_items = current_user.feed.paginate(page: params[:page])
   end
  end

  def about
  end

  def help
  end

end
