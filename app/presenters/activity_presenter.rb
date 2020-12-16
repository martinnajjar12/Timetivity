class ActivityPresenter < BasePresenter
  presents :activity

  def activity_icon
    if activity.group.icon.attached?
      image_tag(activity.group.icon, class: 'img-thumbnail icon')
    else
      image_tag('default.png', class: 'img-thumbnail icon')
    end
  end
end