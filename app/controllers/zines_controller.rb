class ZinesController < ApplicationController
  def show
    @zines = Zine.where(user_id: current_user.id)
    @zine = Zine.find(params[:id])
    @post = Post.new
    @posts = @zine.posts
  end

  def user_private
    @zine = Zine.find(params[:id])
    @zine.private = !@zine.private # privates でなく private かも
    @zine.save # ここでuser_params使わないの？？？
  end

  def index
    @zines = Zine.where(private: false).order(created_at: :desc)
  end

  private

  def user_params
    params.require(:zine).permit(:private)
  end
end
