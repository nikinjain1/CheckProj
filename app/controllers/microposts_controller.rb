class MicropostsController < ApplicationController
  before_filter :signed_in_user,:only => [:create, :destroy]
  before_filter :correct_user, :only => :destroy

  def index
  end

  def create
  	@micropost = current_user.microposts.build(params[:micropost])
  	if @micropost.save
  		flash[:success] = "Micropost created!"
  		redirect_to root_url
  	else
      @feed_items = []
  		render 'static_pages/home'
  	end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  def repost
    m = Micropost.find(params[:micropost])
    @micropost = Micropost.new
    @micropost.content = m.content
    @micropost.user_id = current_user.id
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  private

  def correct_user
       @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
  end

end