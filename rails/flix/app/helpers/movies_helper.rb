module MoviesHelper

	def total_gross(movie)
		if movie.flop?
			content_tag(:strong, "Flop!")
		else
			number_to_currency(movie.total_gross).to_s
		end
	end

	def image_for(movie)
		if movie.image_file_name.blank?
			image_tag("placeholder.png")
		else
			image_tag(movie.image_file_name)
		end	
	end

	def format_average_stars(movie)
		if movie.average_stars.blank?
			content_tag(:strong, "No Reviews")
		else
			pluralize(number_with_precision(movie.average_stars, precison: 1), 'star')
		end
	end
end
