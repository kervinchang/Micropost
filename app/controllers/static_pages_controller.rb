class StaticPagesController < ApplicationController
  def home
    # @mcpost = current_user.mcposts.build if logged_in?
    if logged_in?
      @mcpost = current_user.mcposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
