# Rakefile for rubypants  -*-ruby-*-
require 'rdoc/task'
require 'rake/testtask'
require 'rubygems/package_task'


desc "Run all the tests"
task :default => [:test]

desc "Do predistribution stuff"
task :predist => [:doc]

Rake::TestTask.new(:test) do |t|
  t.pattern = "#{File.dirname(__FILE__)}/test/all.rb"
  t.verbose = true
end
Rake::Task['test'].comment = "Run all rubypants tests"

desc "Generate RDoc documentation"
Rake::RDocTask.new(:doc) do |rdoc|
  rdoc.options << '--line-numbers --inline-source --all'
  rdoc.rdoc_files.include 'README'
  rdoc.rdoc_files.include 'lib'
end

Gem::PackageTask.new(eval(File.read("rubypants-unicode.gemspec"))) { |pkg| }
