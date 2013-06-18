def movie_listing(title)
  "Movie: #{title.capitalize}"
end

puts movie_listing("goonies")
puts(movie_listing("goonies"))

a_title = "ghostbusters"
puts movie_listing(a_title)

def movie_listing(title, rank)
  "#{title.capitalize} has a rank of #{rank}."
end

puts movie_listing("goonies", 10)
puts movie_listing("ghostbusters", 9)

def movie_listing(title, rank=0)
  "#{title.capitalize} has a rank of #{rank}."
end

puts movie_listing("goonies", 10)
puts movie_listing("ghostbusters", 9)
puts movie_listing("goldfinger")

def movie_listing(title, rank=name.length)
  "#{title.capitalize} has a rank of #{rank}."
end

def movie_listing(title, rank=0)
  current_time = Time.new
  today = current_time.strftime("%A")
  "#{title.capitalize} has a rank of 
   #{rank} as of #{today}."
end

puts movie_listing("goonies", 10)
puts movie_listing("ghostbusters", 9)
puts movie_listing("goldfinger")

def weekday
  current_time = Time.new
  current_time.strftime("%A")
end


def movie_listing(title, rank=0)
  today = weekday
  "#{title.capitalize} has a rank of 
   #{rank} as of #{today}."
end


def movie_listing(title, rank=0)
  "#{title.capitalize} has a rank of 
   #{rank} as of #{weekday}."
end

def movie_listing(title, rank=0)
  "#{weekday.upcase}: #{title.capitalize} 
   has a rank of #{rank}."
end

puts movie_listing("goonies", 10)
puts movie_listing("ghostbusters", 9)
puts movie_listing("goldfinger")

def movie_listing(title, rank=0)
  title_formatted = title.capitalize.ljust(30, '.')
  "#{title_formatted} #{rank}"
end