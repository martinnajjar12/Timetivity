module ActivitiesHelper

  def total_time
    if @activities.nil?
      0
    else
      @activities.map(&:time).sum
    end
  end
end
