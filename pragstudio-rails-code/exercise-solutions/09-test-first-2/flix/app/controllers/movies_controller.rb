class MoviesController < ApplicationController
  def index
    @movies = ["Movie 1", "Movie 2", "Movie 3"]
  end
end
