module GroupsHelper

  def total_time
    @group_activities.map(&:time).sum
  end
end
