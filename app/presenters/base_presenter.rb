class BasePresenter
  def initialize(object, template)
    @object = object
    @template = template
  end

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  def h
    @template
  end

  # This method was made in to not use h.undefined method eah time in the presenter classes
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end

  def user_avatar(user)
    link_to user_path(user.id), class: 'link' do
      if user.avatar.attached?
        image_tag(user.avatar, class: 'rounded-circle')
      else
        gravatar_image_tag(user.email, class: 'rounded-circle')
      end
      content_tag(:h2, user.name, class: 'text-white')
    end
  end
end