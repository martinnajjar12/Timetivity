module ApplicationHelper
  def present(object, _kalass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def total_time
    if @group_activities.nil?
      0
    else
      @group_activities.map(&:time).sum
    end
  end
end
