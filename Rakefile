require "rdoc/task"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Generate RDoc documentation"
Rake::RDocTask.new(:doc) do |rdoc|
 rdoc.options << '--line-numbers --inline-source --all'
 rdoc.rdoc_files.include 'README'
 rdoc.rdoc_files.include 'lib'
end

desc "Run the tests"
task :default => :test
