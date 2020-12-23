module ApplicationHelper
  def present(object, _kalass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def alert_messages
    if flash[:notice]
      content_tag(:div, flash[:notice], class: 'alert alert-success', role: 'alert')
    elsif flash[:alert]
      content_tag(:div, flash[:alert], class: 'alert alert-danger', role: 'alert')
    end
  end

  def navbar_brand
    unless user_signed_in?
      link_to "Timetivity", root_path, class: 'navbar-brand'
    end
  end

  def nav_links
    if user_signed_in?
      content_tag :span, class: 'd-flex' do
        concat(content_tag(:span, (link_to 'Home', root_path, class: 'nav-link')))
        concat(content_tag(:span, (link_to 'Activities', user_activities_path(current_user.id), class: 'nav-link')))
        concat(content_tag(:span, (link_to 'E-Activities', user_group_path(current_user.id, external_group_id),
                                           class: 'nav-link')))
        concat(content_tag(:span, (link_to 'Sign Out', destroy_user_session_path,
                                           method: :delete, class: 'btn btn-outline-light btn-sm')))
      end
    else
      content_tag :span, class: 'd-flex' do
        concat(content_tag(:span, (link_to 'Sign In', new_user_session_path, class: 'nav-link')))
        concat(content_tag(:span, (link_to 'Sign Up', new_user_registration_path, class: 'nav-link')))
      end
    end
  end

  # rubocop:disable Lint/EmptyExpression
  def user_avatar
    if current_user.avatar.attached?
      content_tag(:div, (), class: 'picture-div mx-auto rounded-circle',
                            style: "background-image: url('#{url_for(current_user.avatar)}')")
    else
      gravatar_image_tag(current_user.email, class: 'rounded-circle')
    end
  end
  # rubocop:enable Lint/EmptyExpression
end
