Gem::Specification.new do |s|
  s.name = 'rubypants-unicode'
  s.version = '0.2.0'
  s.summary = "RubyPants-Unicode is a Ruby port of the smart-quotes library SmartyPants."
  s.description = <<-EOF
RubyPants-Unicode is a Ruby port of the smart-quotes library SmartyPants that outputs
unicode characters (UTF-8) instead of HTML entities.

The original "SmartyPants" is a free web publishing plug-in for
Movable Type, Blosxom, and BBEdit that easily translates plain ASCII
punctuation characters into "smart" typographic punctuation HTML
entities.
  EOF
  s.files = FileList['**/*rb', 'README', 'Rakefile'].to_a
  s.test_file = "test_rubypants.rb"
  s.extra_rdoc_files = ["README"]
  s.rdoc_options = ["--main", "README"]
  s.rdoc_options.concat ['--line-numbers', '--inline-source', '--all']
  s.rdoc_options.concat ['--exclude',  'test_rubypants.rb']
  s.require_path = '.'
  s.authors= ["Chris Chapman", "Christian Neukirchen"]
  s.email = "chris.chapman@aggiemail.usu.edu"
  s.homepage = "https://github.com/cdchapman/rubypants-unicode"
end
