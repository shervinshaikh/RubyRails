Gem::Specification.new do |s|
  s.name         = "INSERT GEM NAME HERE"
  s.version      = "INSERT VERSION HERE"
  s.author       = "INSERT YOUR NAME HERE"
  s.email        = "INSERT YOUR EMAIL HERE"
  s.homepage     = "INSERT HOMEPAGE URL HERE"
  s.summary      = "INSERT SUMMARY HERE"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end