desc "Set up the app with sample events"
task setup: 'db:setup' do
  Event.create([
    {
      name: 'BugSmash',
      location: 'Denver',
      price: 0.00,
      description: 'A fun evening of bug smashing!',
      starts_at: 10.days.from_now
    },
    {
      name: 'Hackathon',
      location: 'Austin',
      price: 15.00,
      description: 'Hunker down at the Hackathon!',
      starts_at: 15.days.from_now
    },
    {
      name: 'Kata Camp',
      location: 'Dallas',
      price: 75.00,
      description: 'Practice your craft kata style!',
      starts_at: 30.days.from_now
    }
  ])
end