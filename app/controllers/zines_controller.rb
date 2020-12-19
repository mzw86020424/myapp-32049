class ZinesController < ApplicationController


  def show
    @zines = Zine.where(user_id: current_user.id)
    @zine = Zine.find(params[:id])
    @post = Post.new
    @posts = Post.where(user_id: current_user.id).where(month: @zine.month).where(year: @zine.year)
  end

end
