def event_attributes(overrides = {})
  {
    name: "BugSmash", 
    location: "Denver",     
    price: 10.00,
    description: 'A fun evening of bug smashing!',
    starts_at: 10.days.from_now,
    image_file_name: 'bugsmash.png',
    capacity: 75
  }.merge(overrides)
end

def registration_attributes(overrides = {})
  {
    name: "Joe Developer", 
    email: "joe@gmail.com",
    how_heard: "Twitter"     
  }.merge(overrides)
end

