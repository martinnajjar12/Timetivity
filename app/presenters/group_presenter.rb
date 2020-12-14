class GroupPresenter < BasePresenter
  presents :group

  def icon
    if group.icon.attached?
      image_tag(group.icon, class: 'rounded-circle img-thumbnail icon')
    else
      image_tag('default.png', class: 'rounded-circle img-thumbnail icon')
    end
  end

  def details(user)
    link_to user_group_path(user.id, group.id), class: 'group_link w-100' do
      name_and_date
    end
  end

  private

  def name_and_date
    content_tag :span do
      concat(content_tag(:span, group.name.capitalize, class: 'group_name ml-4 w-100 d-block'))
      concat(content_tag(:span, "Created #{time_ago_in_words(group.created_at)} ago", class: 'ml-4 border-bottom w-75 d-block'))
    end
  end
end