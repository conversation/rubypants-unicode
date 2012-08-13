# Rakefile for rubypants  -*-ruby-*-
require 'rdoc/task'
require 'rubygems/package_task'


desc "Run all the tests"
task :default => [:test]

desc "Do predistribution stuff"
task :predist => [:doc]


desc "Run all the tests"
task :test do
  ruby 'test_rubypants.rb'
end

desc "Generate RDoc documentation"
Rake::RDocTask.new(:doc) do |rdoc|
  rdoc.options << '--line-numbers --inline-source --all'
  rdoc.rdoc_files.include 'README'
  rdoc.rdoc_files.include 'lib'
end

Gem::PackageTask.new(eval(File.read("rubypants-unicode.gemspec"))) { |pkg| }
