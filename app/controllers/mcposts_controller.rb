class McpostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @mcpost = current_user.mcposts.build(mcpost_params)
    if @mcpost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @mcpost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referer || root_url
  end

  private

    def mcpost_params
      params.require(:mcpost).permit(:content, :picture)
    end

    def correct_user
      @mcpost = current_user.mcposts.find_by(id: params[:id])
      redirect_to root_url if @mcpost.nil?
    end

end
