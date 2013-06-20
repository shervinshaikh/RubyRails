# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create!([
  {
    name: 'BugSmash',
    location: 'Wynkoop in LoDo, Denver, CO',
    price: 0.00,
    starts_at: 100.days.from_now,
    description: %{
      Join us for a fun evening of bug smashing! It's a great
      way to get involved in open source projects whether you're
      reporting bugs, fixing bugs, or even inadvertently creating
      a few bugs!
    }.squish,
    image_file_name: 'bugsmash.png',
    capacity: 75
  },
  {
    name: 'Hackathon',
    location: 'Buffalo Billiards, Austin, TX',
    price: 15.00,
    starts_at: 120.days.from_now,
    description: %{
      Got a killer app idea you've been itching to work on? Hunker
      down at the Hackathon! This is an intense, focused day of hacking
      on anything you want. The entry fee goes toward a bounty of cash 
      and prizes for winners in a variety of categories.
    }.squish,
    image_file_name: 'hackathon.png',
    capacity: 100
  },
  {
    name: 'Kata Camp',
    location: 'Double R Ranch, Dallas, TX',
    price: 75.00,
    starts_at: 150.days.from_now,
    description: %{
      Kata Camp is where developers go to practice their craft without
      the interruptions of a typical project. Forget about having to
      actually ship something. Tell your manager you're going to
      Kata Camp for the day! Price includes a buffet lunch and a
      leather-bound journal to record your kata achievements. 
    }.squish,
    image_file_name: 'katacamp.png',
    capacity: 50
  },
  {
    name: 'Coffee and Code',
    location: 'Stumptown Coffee, Portland, OR',
    price: 0.00,
    starts_at: 170.days.from_now,
    description: %{
      Start your day off right with a good cup of Joe while you sling some code.
      By the time you hit the office, you'll be all tuned up!
    }.squish,
    image_file_name: 'coffeecode.png',
    capacity: 15
  },
  {
    name: 'Cocoa Cook-off',
    location: '1 Infinite Loop, Cupertino, CA',
    price: 25.00,
    starts_at: 180.days.from_now,
    description: %{
      Brew up the tastiest Mac app and win! 
      Entry fee includes a stylish apron.
    }.squish,
    image_file_name: 'cocoacookoff.png',
    capacity: 150
  },
  {
    name: 'Muppets Movie Marathon',
    location: 'Disney Theatre, Orlando, FL',
    price: 15.00,
    starts_at: 190.days.from_now,
    description: %{
      Join us for a non-stop evening of Muppet mania! We'll watch all 
      the hits (and flops), starting with the classics from back in the 
      day and ending with the latest release.
    }.squish,
    image_file_name: 'moviemarathon.png',
    capacity: 200
  },
  {
    name: 'Hokey Karaoke',
    location: 'Hokey Pokey Saloon, Nashville, TN',
    price: 25.00,
    starts_at: 200.days.from_now,
    description: %{
      Come sing along with your favorite country band in Music City!
      Cover charge includes a confidence-boosting beverage of your 
      choice and entry into the YeeHaw Yodelin' contest.
    }.squish,
    image_file_name: 'karaoke.png',
    capacity: 75
  },
  {
    name: 'Rails User Group',
    location: 'Reston, VA',
    price: 0.00,
    starts_at: 2.days.ago,
    description: %{
      Come meet local Rails developers and enjoy a technical talk by a local
      celebrity. This week's topic is a comparison of testing frameworks,
      templating systems, and whether to use tabs or spaces.
    }.squish,
    image_file_name: 'placeholder.png',
    capacity: 30
  }
])
