class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.of(current_user).ordered_alphabetically
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.includes(:activities).find(params[:id])
    @group_activities = @group.activities.ordered_by_most_recent
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      @group.name.capitalize
      flash[:notice] = "#{@group.name} Group has been successfully created!"
      redirect_to user_group_path(current_user.id, @group.id)
    else
      flash[:alert] = "#{@group.name} Group hasn't been created. Please check your inputs!"
      render new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
