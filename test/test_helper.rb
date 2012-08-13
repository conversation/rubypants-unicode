# encoding: utf-8
$KCODE = 'u' unless RUBY_VERSION >= '1.9'

$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
$:.unshift File.expand_path(File.dirname(__FILE__))
$:.uniq!

require 'test/unit'
require 'rubypants-unicode'
