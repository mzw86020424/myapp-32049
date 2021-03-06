class PostsController < ApplicationController
  def index
    t = Time.new
    if Zine.where(month: t.month).where(year: t.year).where(user_id: current_user.id).exists?
      @zine = Zine.find_by(month: t.month, year: t.year, user_id: current_user.id)
    else
      @zine = Zine.new
      @zine = Zine.create(zine_params)
    end
    redirect_to controller: :zines, action: :show, id: @zine.id
  end

  def create
    t = Time.new
    @zine = Zine.where(month: t.month).where(year: t.year).where(user_id: current_user.id)
    @post = Post.new(post_params)
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def zine_params
    t = Time.new
    params.permit(:release).merge(user_id: current_user.id, month: t.month, year: t.year)
  end

  def post_params
    t = Time.new
    params.permit(:url).merge(user_id: current_user.id, month: t.month, year: t.year, zine_id: @zine.ids[0])
  end
end
