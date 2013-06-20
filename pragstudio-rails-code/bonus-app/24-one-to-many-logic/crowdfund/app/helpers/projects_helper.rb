module ProjectsHelper
  def format_pledging_ends_on(project)
    if project.pledging_expired?
      content_tag(:strong, 'All Done!')
    else
      distance_of_time_in_words(Date.today, project.pledging_ends_on) + " remaining"
    end
  end

  def image_for(project)
    if project.image_file_name.blank?
      image_tag 'placeholder.png'
    else
      image_tag project.image_file_name
    end
  end
end
