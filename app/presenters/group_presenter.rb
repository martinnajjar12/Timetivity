class GroupPresenter
  def initialize(group, template)
    @group = group
    @template = template
  end

  def h
    @template
  end

  def icon
    if @group.icon.attached?
      h.image_tag(@group.icon, class: 'rounded-circle img-thumbnail icon')
    else
      h.image_tag('default.png', class: 'rounded-circle img-thumbnail icon')
    end
  end
end