Gem::Specification.new do |s|
  s.name        = 'mogwai'
  s.version     = '0.0.1'
  s.date        = '2010-11-19'
  s.summary     = "Mogwai."
  s.description = "A very simple s3 deployment gem."
  s.authors     = ["Maxwell Folley"]
  s.email       = 'maxwell@madebyflavor.com'
  s.files       = ["lib/mogwai.rb"]
  s.homepage    = 'http://rubygems.org/gems/mogwai'
  s.license     = 'MIT'
  s.add_dependency 'aws-s3', '0.6.3'
end