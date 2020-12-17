module ActivitiesHelper

  def total_time
    if @activities.nil?
      0
    else
      @activities.map(&:time).sum
    end
  end

  def external_group_id
    current_user.groups.find_by(name: "External Activities").id
  end
end
