$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ishizue/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ishizue'
  s.version     = Ishizue::VERSION
  s.authors     = ['Takahiro HAMAGUCHI']
  s.email       = ['tk.hamaguchi@gmail.com']
  s.homepage    = 'https://github.com/tk-hamaguchi/ishizue'
  s.summary     = 'Deploy template generator with Itamae and Capistrano'
  s.description = 'Deploy template generator with Itamae and Capistrano.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.2.3'

  s.add_development_dependency 'sqlite3'

  s.add_dependency 'sinatra', '~> 1.4.6'
  s.add_dependency 'sidekiq', '~> 3.5.0'
  s.add_dependency 'figaro', '~> 1.1.1'
  s.add_dependency 'capistrano',  '~> 3.4.0'
  s.add_dependency 'capistrano-rails', '~> 1.1'
  s.add_dependency 'capistrano-rvm', '~> 0.1.2'
  s.add_dependency 'capistrano-bundler', '~> 1.1.4'
  s.add_dependency 'capistrano-scm-copy', '~> 0.7.0'
  s.add_dependency 'capistrano-template', '~> 0.0.4'
  s.add_dependency 'itamae', '~> 1.6.1'
  s.add_dependency 'highline', '~> 1.7.3'
  s.add_dependency 'itamae-plugin-recipe-selinux', '~> 0.0.5'
  s.add_dependency 'itamae-plugin-recipe-rvm',     '1.0.1'
  s.add_dependency 'serverspec', '~> 2.22.0'
  s.add_dependency 'whenever', '~> 0.9.4'
  s.add_dependency 'itamae-plugin-resource-firewalld', '~> 0.1.1'
end
