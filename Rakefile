# encoding: UTF-8

require "rake/testtask"
Rake::TestTask.new(:test) do |test|
  test.warning = true
  test.libs << "test"
  test.pattern = "test/**/*_test.rb"
end

task :console do
  require "irb"
  require "irb/completion"
  require "pp"

  lib = File.expand_path("../lib/", __FILE__)
  $:.unshift lib unless $:.include?(lib)

  ARGV.clear
  IRB.start
end

task :default => :test
