def project_attributes(overrides = {})
  {
    name: "Test Project",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    target_pledge_amount: 100.00,
    pledging_ends_on: 1.day.from_now,
    website: "http://project.com",
    team_members: "The team members",
    image_file_name: "test.png"
  }.merge(overrides)
end
