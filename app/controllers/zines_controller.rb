class ZinesController < ApplicationController


  def show
    @zines = Zine.where(user_id: current_user.id)
    @zine = Zine.find(params[:id])
    @post = Post.new
    @posts = @zine.posts
  end

end
