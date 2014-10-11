# -*- encoding: utf-8 -*-
require 'rake'
require File.expand_path('../lib/rubypants-unicode/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'rubypants-unicode'
  s.version = RubyPants::VERSION
  s.summary = "RubyPants-Unicode is a Ruby port of the smart-quotes library SmartyPants."
  s.description = <<-EOF
It just occurred to me that if we are encoding our HTML pages in UTF-8 to
handle multiple languages and using web fonts with multilanguage support,
shouldn't we be able to directly insert the simple apostrophe, ellipsis, and
em-dash?

RubyPants-Unicode is a Ruby port of the smart-quotes library SmartyPants that outputs
unicode characters (UTF-8) instead of HTML entities.

The original "SmartyPants" is a free web publishing plug-in for
Movable Type, Blosxom, and BBEdit that easily translates plain ASCII
punctuation characters into "smart" typographic punctuation HTML
entities.
  EOF
  s.files = FileList['lib/**/*.rb', 'README.md', 'Rakefile'].to_a
  s.test_files = ['test/test_rubypants.rb']
  s.extra_rdoc_files = ["README.md"]
  s.rdoc_options = ["--main", "README.md"]
  s.rdoc_options.concat ['--line-numbers', '--inline-source', '--all']
  s.rdoc_options.concat ['--exclude',  'test']
  s.require_paths = ['lib']
  s.authors = [
                "John Gruber",
                "Chad Miller",
                "Christian Neukirchen", 
                "Jeremy McNevin",
                "Chris Chapman"
              ]
  s.email = "chris.chapman@aggiemail.usu.edu"
  s.homepage = "https://github.com/cdchapman/rubypants-unicode"
  s.license = 'MIT'
end
