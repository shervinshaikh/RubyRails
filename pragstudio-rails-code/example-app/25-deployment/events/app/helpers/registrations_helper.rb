module RegistrationsHelper
  def register_link_for(event)
    if event.sold_out?
      content_tag(:strong, "Sold Out")
    else
      hint = content_tag(:span, "Only #{pluralize(event.spots_left, 'spot')} left!", class: 'scarcity')
      link_to "Register! #{hint}".html_safe, new_event_registration_path(event), class: 'button ok register'
    end
  end
end
