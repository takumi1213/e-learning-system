class StaticPagesController < ApplicationController
  def home
    @user = current_user
    if logged_in?
      @activities = Activity.where("user_id IN (?) OR user_id = ?" , current_user.follower_ids , current_user.id)
                            .paginate(page: params[:page]).order("created_at DESC")
    end
  end

  def about
  end

  def contact
  end

end
