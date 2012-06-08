require 'rake/clean'
require 'rake/testtask'
require 'bundler/gem_tasks'

CLEAN.include 'pkg/*.gem', '*.html'

Rake::TestTask.new do |t|
  t.test_files = FileList[ 'test/**' ]
end

task :default => [ 'test' ]
