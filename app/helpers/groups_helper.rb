module GroupsHelper
  def total_time
    @group_activities.nil? ? 0 : @group_activities.map(&:time).sum
  end
end
