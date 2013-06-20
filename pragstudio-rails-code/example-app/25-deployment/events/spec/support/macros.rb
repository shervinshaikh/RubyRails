def register
  fill_in "Name",  with: "Joe Developer"
  fill_in "Email", with: "joe@gmail.com"
  select  "Twitter", :from => "registration_how_heard"        
  click_button 'Create Registration'
end