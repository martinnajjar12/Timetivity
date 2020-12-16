class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all.order('created_at DESC')
  end

  def new
    @activity = Activity.new
  end

  def create
    @group = Group.find(activity_params[:group_id])
    @activity = Activity.new(activity_params)
    @activity.group_id = @group.id
    @activity.user_id = current_user.id

    if @activity.save
      @activity.name.capitalize
      flash[:notice] = 'Activity has been created!'
      redirect_to root_path
    else
      flash[:alert] = "Activity hasn't been created! Check your inputs please!"
      render new
    end
  end

  private
  def activity_params
    params.require(:activity).permit(:name, :time, :group_id)
  end
end
