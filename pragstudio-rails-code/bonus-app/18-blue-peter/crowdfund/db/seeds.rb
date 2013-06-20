# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create([
 {
   name: "Start-Up Project",
   description: "A description of a start-up project",
   target_pledge_amount: 100.00,
   pledging_ends_on: 1.day.from_now,
   website: "http://project-a.com",
   team_members: "Amber, John, Charles",
   image_file_name: "project-a.png"
 },
 {
   name: "Community Project",
   description: "A description of a community project",
   target_pledge_amount: 200.00,
   pledging_ends_on: 1.week.from_now,
   website: "http://project-b.com",
   team_members: "Diana, Jane, Joe",
   image_file_name: "project-b.png"
 },
{
   name: "Personal Project",
   description: "A description of a person project",
   target_pledge_amount: 300.00,
   pledging_ends_on: 1.month.from_now,
   website: "http://project-c.com",
   team_members: "Tom, Harry, Sally",
   image_file_name: "project-c.png"
 },
])
