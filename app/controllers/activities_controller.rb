class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @group = Group.find(params[:group_id])
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
    params.require(:activity).permit(:name, :time)
  end
end
