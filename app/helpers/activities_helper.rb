module ActivitiesHelper
  def activities_total_time
    @activities.nil? ? "Zero" : @activities.map(&:time).sum
  end

  def external_group_id
    current_user.groups.find_by(name: 'External Activities').id
  end
end
