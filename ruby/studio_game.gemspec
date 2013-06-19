Gem::Specification.new do |s|
  s.name         = "studio_game_shervin"
  s.version      = "1.0.0"
  s.author       = "Shervin Shaikh"
  s.email        = "shervinater@gmail.com"
  s.homepage     = "http://shervinshaikh.com"
  s.summary      = "Created while taking Ruby Programming Course"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end