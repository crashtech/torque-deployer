$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'torque/deployer/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'torque-deployer'
  s.version     = Torque::Deployer::VERSION
  s.authors     = ['Carlos Silva', 'Lucas Serrano']
  s.email       = ['carlinhus.fsilva@gmail.com', 'lucasgserrano@hotmail.com']
  s.homepage    = 'https://github.com/crashtech/torque-deployer'
  s.summary     = ''
  s.description = ''
  s.license     = 'MIT'

  s.require_paths = ['lib']

  s.files      = Dir['MIT-LICENSE', 'README.rdoc', 'lib/**/*', 'Rakefile']
  s.test_files = Dir['test/**/*']

  s.required_ruby_version     = '>= 2.2.2'
  s.required_rubygems_version = '>= 1.8.11'

  s.add_dependency 'rails', '~> 5.0', '>= 5.0.0'

  s.add_development_dependency 'rake', '~> 10.1', '>= 10.1.0'
  s.add_development_dependency 'rspec', '~> 3.5', '>= 3.5.0'
end
