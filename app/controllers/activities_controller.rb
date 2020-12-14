class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
    @groups = Group.all.order('name ASC')
  end

  def create
    @activity = current_user.activities.build(activity_params)
    # @activity.group_id = activity_params[:group.id]

    if @activity.save
      @activity.name.capitalize
      flash[:notice] = 'Activity has been created!'
      redirect_to @root
    else
      flash[:alert] = "Activity hasn't been created! Check your inputs please!"
      render new
    end
  end

  private
  def activity_params
    params.require(:activity).permit(:name, :activity)
  end
end
