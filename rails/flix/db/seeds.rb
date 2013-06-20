# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.create!([
  {
    title: 'Iron Man',
    description: 
    %{
      When wealthy industrialist Tony Stark is forced to build an 
      armored suit after a life-threatening incident, he ultimately 
      decides to use its technology to fight against evil.
    }.squish,
    image_file_name: 'ironman.jpg',
    cast: 'Robert Downey Jr., Gwyneth Paltrow and Terrence Howard',
    released_on: "2008-05-02",
    duration: '126 min',
    director: 'Jon Favreau',
    rating: 'PG-13',
    total_gross: 318_412_101
  },
  {
    title: 'Superman',
    description: 
    %{
      An alien orphan is sent from his dying planet to Earth, where 
      he grows up to become his adoptive home's first and greatest 
      super-hero.
    }.squish,
    image_file_name: 'superman.jpg',
    cast: 'Christopher Reeve, Margot Kidder and Gene Hackman',
    released_on: "1978-12-15",
    duration: '143 min',
    director: 'Richard Donner',
    rating: 'PG',
    total_gross: 134_218_018
  },
  {
    title: 'Spider-Man',
    description: 
    %{
      When bitten by a genetically modified spider, a nerdy, shy, and 
      awkward high school student gains spider-like abilities that he 
      eventually must use to fight evil as a superhero after tragedy 
      befalls his family.
    }.squish,
    image_file_name: 'spiderman.jpg',
    cast: 'Tobey Maguire, Kirsten Dunst and Willem Dafoe',
    released_on: "2002-05-03",
    duration: '121 min',
    director: 'Sam Raimi',
    rating: 'PG-13',
    total_gross: 403_706_375
  },
  {
    title: 'Batman',
    description: 
    %{
      The Dark Knight of Gotham City begins his war on crime with his 
      first major enemy being the clownishly homicidal Joker.
    }.squish,
    image_file_name: 'batman.jpg',
    cast: 'Michael Keaton, Jack Nicholson and Kim Basinger',
    released_on: "1989-06-23",
    duration: '126 min',
    director: 'Tim Burton',
    rating: 'PG-13',
    total_gross: 251_188_924
  },
  {
    title: "Catwoman",
    description: 
    %{
      Patience Philips seems destined to spend her life apologizing for taking up space. 
      Despite her artistic ability&mdash;she has a more than respectable career as a graphic 
      designer.
    }.squish,
    image_file_name: "catwoman.jpg",
    cast: "Halle Berry, Sharon Stone and Benjamin Bratt",
    released_on: "2004-07-23",
    duration: "101 min",
    director: "Jean-Christophe 'Pitof' Comar",
    rating: "PG-13",
    total_gross: 40200000.00
  },
  {
    title: 'Batman vs. Godzilla',
    description: 
    %{
      An epic battle between The Caped Crusader and the fire-breathing dinosaur Gojira.
      Hang on to your popcorn, kids!
    }.squish,
    image_file_name: 'batman-vs-godzilla.jpg',
    cast: 'Bruce Wayne, Gojira',
    released_on: 10.days.from_now,
    duration: '211 min',
    director: 'Ishiro Honda',
    rating: 'PG-13',
    total_gross: 387_623_910
  }
])
