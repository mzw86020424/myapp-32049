class ZinesController < ApplicationController
  def index
    @zines = Zine.where(user_id: current_user.id)
    @post = Post.new
  end

  def show
    @zines = Zine.where(user_id: current_user.id)
    @zine = Zine.find(params[:id])
    @posts = Post.where(user_id: current_user.id).where(month: @zine.month).where(year: @zine.year)
  end

end
