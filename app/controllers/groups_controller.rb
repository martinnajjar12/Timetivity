class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.where(user_id: current_user.id).order('name ASC')
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.includes(:activities).find(params[:id])
    @group_activities = @group.activities.all
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
