class ZinesController < ApplicationController
  def index
    @zines = Zine.where(user_id: current_user.id)
  end
end
