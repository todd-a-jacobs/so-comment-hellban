# -*- encoding: utf-8 -*-
require File.expand_path('../lib/so-comment-hellban/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Todd A. Jacobs']
  gem.email         = ['github.projects@codegnome.org']
  gem.description   = %q{
This is a calculator for determining how close a user is to being
comment-hellbanned on Stack Overflow. You can find your flag counts at
http://stackoverflow.com/users/flag-summary/<stackoverflow_userid>.}
  gem.summary       = %q{Calculator for Stack Overflow's Comment-Hellban Algorithm}
  gem.homepage      = "https://github.com/CodeGnome/so-comment-hellban"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'so-comment-hellban'
  gem.license       = 'GPLv3'
  gem.require_paths = ['lib']
  gem.version       = SO_Comment_Hellban::VERSION
end
