def pledge_attributes(overrides = {})
  {
    name: "Joe Developer",
    email: "joe@gmail.com",
    comment: "Count me in!",
    amount: 100.00
  }.merge(overrides)
end
