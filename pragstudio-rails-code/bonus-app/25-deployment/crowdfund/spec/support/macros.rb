def pledge(amount = "100.0")
  fill_in "Name",  with: "Joe Smith"
  fill_in "Email", with: "joe@gmail.com"
  select  amount, :from => "pledge_amount"
  click_button 'Create Pledge'
end
