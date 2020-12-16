module GroupsHelper

  def total_time
    if @group_activities.nil?
      0
    else
      @group_activities.map(&:time).sum
    end
  end
end
