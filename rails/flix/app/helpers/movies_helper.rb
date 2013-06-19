module MoviesHelper

	def total_gross(movie)
		if movie.flop?
			content_tag(:strong, "Flop!")
		else
			number_to_currency(movie.total_gross).to_s
		end
	end

end
